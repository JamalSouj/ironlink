-- coach invites table
create table coach_invites (
  id uuid primary key default gen_random_uuid(),
  coach_id uuid references profiles(id) not null,
  invite_code text not null unique,
  status text not null default 'active' check (status in ('active','consumed')),
  created_at timestamptz default now()
);

alter table coach_invites enable row level security;

-- Coaches can manage their own invites
create policy "Coaches manage their invites" on coach_invites for all using (auth.uid() = coach_id);
-- Anyone can read active invites to validate them during signup
create policy "Anyone can read active invites" on coach_invites for select using (status = 'active');


-- RPC to consume invite and create client atomically
create or replace function consume_invite_and_create_client(
  p_invite_code text,
  p_auth_user_id uuid,
  p_full_name text,
  p_email text
) returns void as $$
declare
  v_coach_id uuid;
begin
  -- 1. Find the active invite
  select coach_id into v_coach_id
  from coach_invites
  where invite_code = p_invite_code and status = 'active'
  for update; -- lock the row

  if v_coach_id is null then
    raise exception 'Invalid or consumed invite code';
  end if;

  -- 2. Mark invite as consumed
  update coach_invites
  set status = 'consumed'
  where invite_code = p_invite_code;

  -- 3. Insert the profile
  -- We don't insert email into profiles because it's in auth.users, but we have full_name
  insert into profiles (id, role, full_name)
  values (p_auth_user_id, 'client', p_full_name);

  -- 4. Create the coach-client relationship
  insert into coach_clients (coach_id, client_id, status)
  values (v_coach_id, p_auth_user_id, 'active');

end;
$$ language plpgsql security definer;
-- Security definer allows this to bypass RLS to insert into profiles and coach_clients
-- even though the user just signed up (RLS policies for insert profile require auth.uid() = id,
-- which might evaluate correctly, but for coach_clients it requires auth.uid() = coach_id which is false for the client).
