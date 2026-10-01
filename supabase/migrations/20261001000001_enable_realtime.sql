-- Enable Realtime for all tables that the Flutter app listens to via .stream()

-- First, check if the publication exists, if not create it (Supabase usually has it by default)
-- CREATE PUBLICATION supabase_realtime;

-- Add tables to the supabase_realtime publication
ALTER PUBLICATION supabase_realtime ADD TABLE coach_clients;
ALTER PUBLICATION supabase_realtime ADD TABLE progressions;
ALTER PUBLICATION supabase_realtime ADD TABLE progression_levels;
ALTER PUBLICATION supabase_realtime ADD TABLE client_progression_status;
ALTER PUBLICATION supabase_realtime ADD TABLE programs;
ALTER PUBLICATION supabase_realtime ADD TABLE program_blocks;
ALTER PUBLICATION supabase_realtime ADD TABLE workout_sessions;
ALTER PUBLICATION supabase_realtime ADD TABLE set_logs;
ALTER PUBLICATION supabase_realtime ADD TABLE subscriptions;
ALTER PUBLICATION supabase_realtime ADD TABLE messages;
ALTER PUBLICATION supabase_realtime ADD TABLE readiness_logs;
ALTER PUBLICATION supabase_realtime ADD TABLE exercises;
ALTER PUBLICATION supabase_realtime ADD TABLE coach_invites;
