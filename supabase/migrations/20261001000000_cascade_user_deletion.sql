-- 1. Drop existing foreign key constraints & re-add them with ON DELETE CASCADE / ON DELETE SET NULL

-- coach_clients
ALTER TABLE coach_clients DROP CONSTRAINT IF EXISTS coach_clients_coach_id_fkey;
ALTER TABLE coach_clients ADD CONSTRAINT coach_clients_coach_id_fkey FOREIGN KEY (coach_id) REFERENCES profiles(id) ON DELETE CASCADE;

ALTER TABLE coach_clients DROP CONSTRAINT IF EXISTS coach_clients_client_id_fkey;
ALTER TABLE coach_clients ADD CONSTRAINT coach_clients_client_id_fkey FOREIGN KEY (client_id) REFERENCES profiles(id) ON DELETE CASCADE;

-- coach_invites
ALTER TABLE coach_invites DROP CONSTRAINT IF EXISTS coach_invites_coach_id_fkey;
ALTER TABLE coach_invites ADD CONSTRAINT coach_invites_coach_id_fkey FOREIGN KEY (coach_id) REFERENCES profiles(id) ON DELETE CASCADE;

-- programs
ALTER TABLE programs DROP CONSTRAINT IF EXISTS programs_coach_id_fkey;
ALTER TABLE programs ADD CONSTRAINT programs_coach_id_fkey FOREIGN KEY (coach_id) REFERENCES profiles(id) ON DELETE CASCADE;

ALTER TABLE programs DROP CONSTRAINT IF EXISTS programs_client_id_fkey;
ALTER TABLE programs ADD CONSTRAINT programs_client_id_fkey FOREIGN KEY (client_id) REFERENCES profiles(id) ON DELETE CASCADE;

-- workout_sessions
ALTER TABLE workout_sessions DROP CONSTRAINT IF EXISTS workout_sessions_client_id_fkey;
ALTER TABLE workout_sessions ADD CONSTRAINT workout_sessions_client_id_fkey FOREIGN KEY (client_id) REFERENCES profiles(id) ON DELETE CASCADE;

-- readiness_logs
ALTER TABLE readiness_logs DROP CONSTRAINT IF EXISTS readiness_logs_client_id_fkey;
ALTER TABLE readiness_logs ADD CONSTRAINT readiness_logs_client_id_fkey FOREIGN KEY (client_id) REFERENCES profiles(id) ON DELETE CASCADE;

-- messages
ALTER TABLE messages DROP CONSTRAINT IF EXISTS messages_sender_id_fkey;
ALTER TABLE messages ADD CONSTRAINT messages_sender_id_fkey FOREIGN KEY (sender_id) REFERENCES profiles(id) ON DELETE CASCADE;

ALTER TABLE messages DROP CONSTRAINT IF EXISTS messages_recipient_id_fkey;
ALTER TABLE messages ADD CONSTRAINT messages_recipient_id_fkey FOREIGN KEY (recipient_id) REFERENCES profiles(id) ON DELETE CASCADE;

-- client_progression_status
ALTER TABLE client_progression_status DROP CONSTRAINT IF EXISTS client_progression_status_client_id_fkey;
ALTER TABLE client_progression_status ADD CONSTRAINT client_progression_status_client_id_fkey FOREIGN KEY (client_id) REFERENCES profiles(id) ON DELETE CASCADE;

-- subscriptions
ALTER TABLE subscriptions DROP CONSTRAINT IF EXISTS subscriptions_coach_id_fkey;
ALTER TABLE subscriptions ADD CONSTRAINT subscriptions_coach_id_fkey FOREIGN KEY (coach_id) REFERENCES profiles(id) ON DELETE CASCADE;

-- exercises & progressions created_by (SET NULL so shared/custom exercises aren't lost when coach is deleted)
ALTER TABLE exercises DROP CONSTRAINT IF EXISTS exercises_created_by_fkey;
ALTER TABLE exercises ADD CONSTRAINT exercises_created_by_fkey FOREIGN KEY (created_by) REFERENCES profiles(id) ON DELETE SET NULL;

ALTER TABLE progressions DROP CONSTRAINT IF EXISTS progressions_created_by_fkey;
ALTER TABLE progressions ADD CONSTRAINT progressions_created_by_fkey FOREIGN KEY (created_by) REFERENCES profiles(id) ON DELETE SET NULL;
