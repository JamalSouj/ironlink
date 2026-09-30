-- Enable realtime for tables that need live updates in the app
alter publication supabase_realtime add table subscriptions;
alter publication supabase_realtime add table messages;
alter publication supabase_realtime add table workout_sessions;
alter publication supabase_realtime add table readiness_logs;
alter publication supabase_realtime add table client_progression_status;
