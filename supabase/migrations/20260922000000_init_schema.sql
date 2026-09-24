-- profiles (1:1 with auth.users, split by role)
create table profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  role text not null check (role in ('coach','client')),
  full_name text not null,
  avatar_url text,
  created_at timestamptz default now()
);

-- coach <-> client relationship (a client belongs to exactly one active coach in v1)
create table coach_clients (
  id uuid primary key default gen_random_uuid(),
  coach_id uuid references profiles(id) not null,
  client_id uuid references profiles(id) not null unique,
  status text not null default 'active' check (status in ('active','paused','archived')),
  created_at timestamptz default now()
);

-- exercise library
create table exercises (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  category text not null check (category in ('calisthenics_skill','compound_lift','accessory','mobility')),
  demo_video_url text,
  created_by uuid references profiles(id), -- null = global/system exercise
  created_at timestamptz default now()
);

-- progressions: ordered skill trees
create table progressions (
  id uuid primary key default gen_random_uuid(),
  name text not null,                 -- e.g. "Strict Pull-up"
  created_by uuid references profiles(id),
  created_at timestamptz default now()
);

create table progression_levels (
  id uuid primary key default gen_random_uuid(),
  progression_id uuid references progressions(id) not null,
  exercise_id uuid references exercises(id) not null,
  level_order int not null,           -- sequence within the progression
  unlock_criteria jsonb not null,     -- {"sets":5,"reps":8,"rpe_max":8,"consecutive_sessions":2}
  unique (progression_id, level_order)
);

-- per-client status on each progression
create table client_progression_status (
  id uuid primary key default gen_random_uuid(),
  client_id uuid references profiles(id) not null,
  progression_id uuid references progressions(id) not null,
  current_level_id uuid references progression_levels(id),
  unlocked_at timestamptz default now(),
  unique (client_id, progression_id)
);

-- programs (macrocycle container)
create table programs (
  id uuid primary key default gen_random_uuid(),
  coach_id uuid references profiles(id) not null,
  client_id uuid references profiles(id) not null,
  name text not null,
  start_date date not null,
  end_date date,
  created_at timestamptz default now()
);

-- mesocycle blocks within a program
create table program_blocks (
  id uuid primary key default gen_random_uuid(),
  program_id uuid references programs(id) not null,
  name text not null,                 -- "Hypertrophy Block", "Peaking Block"
  block_order int not null,
  focus text                          -- 'hypertrophy' | 'strength' | 'peaking' | 'deload'
);

-- a single scheduled workout
create table workout_sessions (
  id uuid primary key default gen_random_uuid(),
  program_block_id uuid references program_blocks(id),
  client_id uuid references profiles(id) not null,
  scheduled_date date not null,
  status text not null default 'scheduled' check (status in ('scheduled','completed','skipped')),
  session_rpe int,                    -- filled after completion
  duration_minutes int
);

-- planned + logged sets, one row per set
create table set_logs (
  id uuid primary key default gen_random_uuid(),
  workout_session_id uuid references workout_sessions(id) not null,
  exercise_id uuid references exercises(id) not null,
  set_order int not null,
  prescribed_reps int,
  prescribed_load_kg numeric,
  prescribed_pct_1rm numeric,
  actual_reps int,
  actual_load_kg numeric,
  actual_rpe numeric,
  tempo text,
  completed_at timestamptz
);

-- daily readiness/fatigue check-in, independent of a specific workout
create table readiness_logs (
  id uuid primary key default gen_random_uuid(),
  client_id uuid references profiles(id) not null,
  log_date date not null,
  sleep_quality int,       -- 1-5
  soreness int,            -- 1-5
  stress int,              -- 1-5
  readiness_score numeric, -- computed
  unique (client_id, log_date)
);

-- coach subscription / billing (Stripe)
create table subscriptions (
  id uuid primary key default gen_random_uuid(),
  coach_id uuid references profiles(id) unique not null,
  stripe_customer_id text,
  stripe_subscription_id text,
  plan text check (plan in ('starter','pro')),
  status text check (status in ('trialing','active','past_due','canceled')),
  current_period_end timestamptz
);

-- messaging
create table messages (
  id uuid primary key default gen_random_uuid(),
  sender_id uuid references profiles(id) not null,
  recipient_id uuid references profiles(id) not null,
  body text,
  attachment_url text,
  created_at timestamptz default now(),
  read_at timestamptz
);

-- --------------------------------------------------------------------------------
-- ROW LEVEL SECURITY POLICIES
-- --------------------------------------------------------------------------------

-- Enable RLS for all tables
alter table profiles enable row level security;
alter table coach_clients enable row level security;
alter table exercises enable row level security;
alter table progressions enable row level security;
alter table progression_levels enable row level security;
alter table client_progression_status enable row level security;
alter table programs enable row level security;
alter table program_blocks enable row level security;
alter table workout_sessions enable row level security;
alter table set_logs enable row level security;
alter table readiness_logs enable row level security;
alter table subscriptions enable row level security;
alter table messages enable row level security;

-- Profiles:
-- Users can read their own profile.
-- Coaches can read their clients' profiles.
create policy "Users can read own profile" on profiles for select using (auth.uid() = id);
create policy "Coaches can read client profiles" on profiles for select using (
  exists (
    select 1 from coach_clients
    where coach_clients.coach_id = auth.uid()
      and coach_clients.client_id = profiles.id
  )
);
create policy "Users can update own profile" on profiles for update using (auth.uid() = id);
create policy "Users can insert own profile" on profiles for insert with check (auth.uid() = id);

-- Coach Clients:
-- Coaches can read/write their own coach_clients rows
create policy "Coaches manage their clients" on coach_clients for all using (auth.uid() = coach_id);
-- Clients can read their coach_clients row
create policy "Clients can read their coach association" on coach_clients for select using (auth.uid() = client_id);

-- Exercises:
-- Anyone can read global exercises (created_by IS NULL)
create policy "Anyone can read global exercises" on exercises for select using (created_by is null);
-- Coaches can manage their own exercises
create policy "Coaches manage own exercises" on exercises for all using (auth.uid() = created_by);
-- Clients can read exercises assigned to them (either by coach, or global is already covered)
create policy "Clients can read assigned exercises" on exercises for select using (
  exists (
    select 1 from set_logs
    join workout_sessions ws on ws.id = set_logs.workout_session_id
    where set_logs.exercise_id = exercises.id
      and ws.client_id = auth.uid()
  )
  or
  exists (
    select 1 from coach_clients
    where coach_clients.client_id = auth.uid()
      and coach_clients.coach_id = exercises.created_by
  )
);

-- Progressions:
create policy "Anyone can read global progressions" on progressions for select using (created_by is null);
create policy "Coaches manage own progressions" on progressions for all using (auth.uid() = created_by);
create policy "Clients read coach progressions" on progressions for select using (
  exists (
    select 1 from coach_clients
    where coach_clients.client_id = auth.uid()
      and coach_clients.coach_id = progressions.created_by
  )
);

-- Progression Levels:
create policy "Read access to progression levels" on progression_levels for select using (
  true -- Public read for levels (we filter at progression level anyway)
);
create policy "Coaches manage progression levels" on progression_levels for all using (
  exists (
    select 1 from progressions
    where progressions.id = progression_levels.progression_id
      and progressions.created_by = auth.uid()
  )
);

-- Client Progression Status:
create policy "Clients can read own status" on client_progression_status for select using (auth.uid() = client_id);
create policy "Coaches manage client status" on client_progression_status for all using (
  exists (
    select 1 from coach_clients
    where coach_clients.coach_id = auth.uid()
      and coach_clients.client_id = client_progression_status.client_id
  )
);

-- Programs:
create policy "Coaches manage programs" on programs for all using (auth.uid() = coach_id);
create policy "Clients read own programs" on programs for select using (auth.uid() = client_id);

-- Program Blocks:
create policy "Coaches manage blocks" on program_blocks for all using (
  exists (
    select 1 from programs
    where programs.id = program_blocks.program_id
      and programs.coach_id = auth.uid()
  )
);
create policy "Clients read own blocks" on program_blocks for select using (
  exists (
    select 1 from programs
    where programs.id = program_blocks.program_id
      and programs.client_id = auth.uid()
  )
);

-- Workout Sessions:
create policy "Clients read/update own sessions" on workout_sessions for select using (auth.uid() = client_id);
create policy "Clients can update own sessions" on workout_sessions for update using (auth.uid() = client_id);
create policy "Coaches manage client sessions" on workout_sessions for all using (
  exists (
    select 1 from coach_clients
    where coach_clients.coach_id = auth.uid()
      and coach_clients.client_id = workout_sessions.client_id
  )
);

-- Set Logs:
create policy "Clients read/update own sets" on set_logs for select using (
  exists (
    select 1 from workout_sessions
    where workout_sessions.id = set_logs.workout_session_id
      and workout_sessions.client_id = auth.uid()
  )
);
create policy "Clients update own sets" on set_logs for update using (
  exists (
    select 1 from workout_sessions
    where workout_sessions.id = set_logs.workout_session_id
      and workout_sessions.client_id = auth.uid()
  )
);
create policy "Coaches manage client sets" on set_logs for all using (
  exists (
    select 1 from workout_sessions
    join coach_clients on coach_clients.client_id = workout_sessions.client_id
    where workout_sessions.id = set_logs.workout_session_id
      and coach_clients.coach_id = auth.uid()
  )
);

-- Readiness Logs:
create policy "Clients manage own readiness" on readiness_logs for all using (auth.uid() = client_id);
create policy "Coaches read client readiness" on readiness_logs for select using (
  exists (
    select 1 from coach_clients
    where coach_clients.coach_id = auth.uid()
      and coach_clients.client_id = readiness_logs.client_id
  )
);

-- Subscriptions:
create policy "Coaches read own subscriptions" on subscriptions for select using (auth.uid() = coach_id);
-- (Stripe webhook updates via service role)

-- Messages:
create policy "Users read/write own messages" on messages for all using (
  auth.uid() = sender_id or auth.uid() = recipient_id
);
