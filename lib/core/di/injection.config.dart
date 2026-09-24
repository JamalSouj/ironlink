// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes

import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;

import '../../features/auth/data/datasources/remote/supabase_auth_data_source.dart'
    as _i949;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/sign_in.dart' as _i920;
import '../../features/auth/domain/usecases/sign_out.dart' as _i568;
import '../../features/auth/domain/usecases/sign_up_client.dart' as _i310;
import '../../features/auth/domain/usecases/sign_up_coach.dart' as _i654;
import '../../features/auth/domain/usecases/watch_auth_state.dart' as _i935;
import '../../features/auth/presentation/bloc/auth_bloc.dart' as _i797;
import '../../features/billing/data/datasources/remote/supabase_billing_data_source.dart'
    as _i661;
import '../../features/billing/data/repositories/billing_repository_impl.dart'
    as _i632;
import '../../features/billing/domain/repositories/billing_repository.dart'
    as _i276;
import '../../features/billing/domain/usecases/check_subscription_status.dart'
    as _i575;
import '../../features/billing/domain/usecases/create_checkout_session.dart'
    as _i488;
import '../../features/billing/domain/usecases/watch_subscription_status.dart'
    as _i583;
import '../../features/billing/presentation/bloc/billing_bloc.dart' as _i1031;
import '../../features/coaching/data/datasources/remote/supabase_coaching_data_source.dart'
    as _i406;
import '../../features/coaching/data/repositories/coaching_repository_impl.dart'
    as _i636;
import '../../features/coaching/domain/repositories/coaching_repository.dart'
    as _i921;
import '../../features/coaching/domain/usecases/generate_invite_code.dart'
    as _i218;
import '../../features/coaching/domain/usecases/watch_my_clients.dart' as _i193;
import '../../features/coaching/presentation/bloc/invite/invite_bloc.dart'
    as _i661;
import '../../features/coaching/presentation/bloc/roster/roster_bloc.dart'
    as _i933;
import '../../features/fatigue/data/datasources/remote/supabase_fatigue_data_source.dart'
    as _i861;
import '../../features/fatigue/data/repositories/fatigue_repository_impl.dart'
    as _i509;
import '../../features/fatigue/domain/repositories/fatigue_repository.dart'
    as _i887;
import '../../features/fatigue/domain/usecases/watch_client_fatigue_data.dart'
    as _i358;
import '../../features/fatigue/presentation/bloc/fatigue_dashboard_bloc.dart'
    as _i462;
import '../../features/messaging/data/datasources/remote/supabase_messaging_data_source.dart'
    as _i946;
import '../../features/messaging/data/repositories/messaging_repository_impl.dart'
    as _i25;
import '../../features/messaging/domain/repositories/messaging_repository.dart'
    as _i742;
import '../../features/messaging/domain/usecases/mark_thread_as_read.dart'
    as _i870;
import '../../features/messaging/domain/usecases/send_message.dart' as _i1045;
import '../../features/messaging/domain/usecases/watch_thread.dart' as _i407;
import '../../features/messaging/domain/usecases/watch_unread_count.dart'
    as _i82;
import '../../features/messaging/presentation/bloc/badge/unread_badge_bloc.dart'
    as _i198;
import '../../features/messaging/presentation/bloc/chat/chat_thread_bloc.dart'
    as _i97;
import '../../features/programs/data/datasources/local/hive_programs_data_source.dart'
    as _i833;
import '../../features/programs/data/datasources/remote/supabase_programs_data_source.dart'
    as _i665;
import '../../features/programs/data/repositories/programs_repository_impl.dart'
    as _i934;
import '../../features/programs/domain/repositories/programs_repository.dart'
    as _i1036;
import '../../features/programs/domain/usecases/add_program_block.dart'
    as _i784;
import '../../features/programs/domain/usecases/add_set_log.dart' as _i683;
import '../../features/programs/domain/usecases/complete_session.dart' as _i342;
import '../../features/programs/domain/usecases/create_program.dart' as _i139;
import '../../features/programs/domain/usecases/duplicate_block.dart' as _i344;
import '../../features/programs/domain/usecases/duplicate_week.dart' as _i262;
import '../../features/programs/domain/usecases/log_set.dart' as _i29;
import '../../features/programs/domain/usecases/schedule_workout_session.dart'
    as _i266;
import '../../features/programs/domain/usecases/watch_client_programs.dart'
    as _i200;
import '../../features/programs/domain/usecases/watch_program_blocks.dart'
    as _i306;
import '../../features/programs/domain/usecases/watch_today_session.dart'
    as _i54;
import '../../features/programs/domain/usecases/watch_upcoming_sessions.dart'
    as _i371;
import '../../features/programs/presentation/bloc/builder/program_builder_bloc.dart'
    as _i822;
import '../../features/programs/presentation/bloc/today/client_today_bloc.dart'
    as _i539;
import '../../features/programs/presentation/bloc/workout/workout_logging_bloc.dart'
    as _i749;
import '../../features/progressions/data/datasources/remote/supabase_progressions_data_source.dart'
    as _i542;
import '../../features/progressions/data/repositories/progressions_repository_impl.dart'
    as _i551;
import '../../features/progressions/domain/repositories/progressions_repository.dart'
    as _i1031;
import '../../features/progressions/domain/usecases/add_progression_level.dart'
    as _i314;
import '../../features/progressions/domain/usecases/create_progression.dart'
    as _i822;
import '../../features/progressions/domain/usecases/evaluate_progression_unlock.dart'
    as _i693;
import '../../features/progressions/domain/usecases/override_client_progression_level.dart'
    as _i187;
import '../../features/progressions/domain/usecases/reorder_progression_levels.dart'
    as _i421;
import '../../features/progressions/domain/usecases/update_client_progression_status.dart'
    as _i655;
import '../../features/progressions/domain/usecases/watch_client_progressions.dart'
    as _i821;
import '../../features/progressions/domain/usecases/watch_coach_progressions.dart'
    as _i433;
import '../../features/progressions/domain/usecases/watch_progression_levels.dart'
    as _i634;
import '../../features/progressions/presentation/bloc/builder/progression_builder_bloc.dart'
    as _i459;
import '../../features/progressions/presentation/bloc/client_progressions/client_progressions_bloc.dart'
    as _i901;
import '../../features/progressions/presentation/bloc/list/progressions_list_bloc.dart'
    as _i918;
import '../../features/readiness/data/datasources/local/hive_readiness_data_source.dart'
    as _i756;
import '../../features/readiness/data/datasources/remote/supabase_readiness_data_source.dart'
    as _i198;
import '../../features/readiness/data/repositories/readiness_repository_impl.dart'
    as _i862;
import '../../features/readiness/domain/repositories/readiness_repository.dart'
    as _i835;
import '../../features/readiness/domain/usecases/check_today_readiness.dart'
    as _i320;
import '../../features/readiness/domain/usecases/submit_readiness.dart'
    as _i535;
import '../../features/readiness/presentation/bloc/readiness_bloc.dart'
    as _i952;
import '../network/supabase_client_provider.dart' as _i106;
import '../network/sync_service.dart' as _i577;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final supabaseModule = _$SupabaseModule();
    gh.factory<_i693.EvaluateProgressionUnlock>(
      () => _i693.EvaluateProgressionUnlock(),
    );
    gh.singleton<_i577.SyncService>(() => _i577.SyncService());
    gh.lazySingleton<_i454.SupabaseClient>(() => supabaseModule.supabaseClient);
    gh.lazySingleton<_i833.HiveProgramsDataSource>(
      () => _i833.HiveProgramsDataSource(),
    );
    gh.lazySingleton<_i756.HiveReadinessDataSource>(
      () => _i756.HiveReadinessDataSource(),
    );
    gh.lazySingleton<_i949.SupabaseAuthDataSource>(
      () => _i949.SupabaseAuthDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i406.SupabaseCoachingDataSource>(
      () => _i406.SupabaseCoachingDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i542.SupabaseProgressionsDataSource>(
      () => _i542.SupabaseProgressionsDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i665.SupabaseProgramsDataSource>(
      () => _i665.SupabaseProgramsDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i198.SupabaseReadinessDataSource>(
      () => _i198.SupabaseReadinessDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i661.SupabaseBillingDataSource>(
      () => _i661.SupabaseBillingDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i946.SupabaseMessagingDataSource>(
      () => _i946.SupabaseMessagingDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i861.SupabaseFatigueDataSource>(
      () => _i861.SupabaseFatigueDataSource(gh<_i454.SupabaseClient>()),
    );
    gh.lazySingleton<_i1036.ProgramsRepository>(
      () => _i934.ProgramsRepositoryImpl(
        gh<_i665.SupabaseProgramsDataSource>(),
        gh<_i833.HiveProgramsDataSource>(),
        gh<_i577.SyncService>(),
      ),
    );
    gh.factory<_i139.CreateProgram>(
      () => _i139.CreateProgram(gh<_i1036.ProgramsRepository>()),
    );
    gh.factory<_i784.AddProgramBlock>(
      () => _i784.AddProgramBlock(gh<_i1036.ProgramsRepository>()),
    );
    gh.factory<_i266.ScheduleWorkoutSession>(
      () => _i266.ScheduleWorkoutSession(gh<_i1036.ProgramsRepository>()),
    );
    gh.factory<_i683.AddSetLog>(
      () => _i683.AddSetLog(gh<_i1036.ProgramsRepository>()),
    );
    gh.factory<_i344.DuplicateBlock>(
      () => _i344.DuplicateBlock(gh<_i1036.ProgramsRepository>()),
    );
    gh.factory<_i262.DuplicateWeek>(
      () => _i262.DuplicateWeek(gh<_i1036.ProgramsRepository>()),
    );
    gh.factory<_i200.WatchClientPrograms>(
      () => _i200.WatchClientPrograms(gh<_i1036.ProgramsRepository>()),
    );
    gh.factory<_i306.WatchProgramBlocks>(
      () => _i306.WatchProgramBlocks(gh<_i1036.ProgramsRepository>()),
    );
    gh.factory<_i371.WatchUpcomingSessions>(
      () => _i371.WatchUpcomingSessions(gh<_i1036.ProgramsRepository>()),
    );
    gh.factory<_i54.WatchTodaySession>(
      () => _i54.WatchTodaySession(gh<_i1036.ProgramsRepository>()),
    );
    gh.factory<_i29.LogSet>(() => _i29.LogSet(gh<_i1036.ProgramsRepository>()));
    gh.factory<_i342.CompleteSession>(
      () => _i342.CompleteSession(gh<_i1036.ProgramsRepository>()),
    );
    gh.lazySingleton<_i887.FatigueRepository>(
      () => _i509.FatigueRepositoryImpl(gh<_i861.SupabaseFatigueDataSource>()),
    );
    gh.lazySingleton<_i921.CoachingRepository>(
      () =>
          _i636.CoachingRepositoryImpl(gh<_i406.SupabaseCoachingDataSource>()),
    );
    gh.lazySingleton<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(gh<_i949.SupabaseAuthDataSource>()),
    );
    gh.factory<_i822.ProgramBuilderBloc>(
      () => _i822.ProgramBuilderBloc(
        gh<_i306.WatchProgramBlocks>(),
        gh<_i784.AddProgramBlock>(),
        gh<_i266.ScheduleWorkoutSession>(),
        gh<_i262.DuplicateWeek>(),
      ),
    );
    gh.factory<_i749.WorkoutLoggingBloc>(
      () => _i749.WorkoutLoggingBloc(
        gh<_i29.LogSet>(),
        gh<_i342.CompleteSession>(),
        gh<_i693.EvaluateProgressionUnlock>(),
      ),
    );
    gh.factory<_i193.WatchMyClients>(
      () => _i193.WatchMyClients(gh<_i921.CoachingRepository>()),
    );
    gh.factory<_i539.ClientTodayBloc>(
      () => _i539.ClientTodayBloc(gh<_i54.WatchTodaySession>()),
    );
    gh.factory<_i920.SignIn>(() => _i920.SignIn(gh<_i787.AuthRepository>()));
    gh.factory<_i654.SignUpCoach>(
      () => _i654.SignUpCoach(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i310.SignUpClient>(
      () => _i310.SignUpClient(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i568.SignOut>(() => _i568.SignOut(gh<_i787.AuthRepository>()));
    gh.factory<_i935.WatchAuthState>(
      () => _i935.WatchAuthState(gh<_i787.AuthRepository>()),
    );
    gh.lazySingleton<_i1031.ProgressionsRepository>(
      () => _i551.ProgressionsRepositoryImpl(
        gh<_i542.SupabaseProgressionsDataSource>(),
      ),
    );
    gh.lazySingleton<_i835.ReadinessRepository>(
      () => _i862.ReadinessRepositoryImpl(
        gh<_i198.SupabaseReadinessDataSource>(),
        gh<_i756.HiveReadinessDataSource>(),
        gh<_i577.SyncService>(),
      ),
    );
    gh.lazySingleton<_i742.MessagingRepository>(
      () =>
          _i25.MessagingRepositoryImpl(gh<_i946.SupabaseMessagingDataSource>()),
    );
    gh.lazySingleton<_i276.BillingRepository>(
      () => _i632.BillingRepositoryImpl(gh<_i661.SupabaseBillingDataSource>()),
    );
    gh.factory<_i358.WatchClientFatigueData>(
      () => _i358.WatchClientFatigueData(gh<_i887.FatigueRepository>()),
    );
    gh.lazySingleton<_i797.AuthBloc>(
      () => _i797.AuthBloc(
        signIn: gh<_i920.SignIn>(),
        signUpCoach: gh<_i654.SignUpCoach>(),
        signUpClient: gh<_i310.SignUpClient>(),
        signOut: gh<_i568.SignOut>(),
        watchAuthState: gh<_i935.WatchAuthState>(),
      ),
    );
    gh.factory<_i535.SubmitReadiness>(
      () => _i535.SubmitReadiness(gh<_i835.ReadinessRepository>()),
    );
    gh.factory<_i320.CheckTodayReadiness>(
      () => _i320.CheckTodayReadiness(gh<_i835.ReadinessRepository>()),
    );
    gh.factory<_i488.CreateCheckoutSession>(
      () => _i488.CreateCheckoutSession(gh<_i276.BillingRepository>()),
    );
    gh.factory<_i583.WatchSubscriptionStatus>(
      () => _i583.WatchSubscriptionStatus(gh<_i276.BillingRepository>()),
    );
    gh.factory<_i575.CheckSubscriptionStatus>(
      () => _i575.CheckSubscriptionStatus(gh<_i276.BillingRepository>()),
    );
    gh.factory<_i407.WatchThread>(
      () => _i407.WatchThread(gh<_i742.MessagingRepository>()),
    );
    gh.factory<_i82.WatchUnreadCount>(
      () => _i82.WatchUnreadCount(gh<_i742.MessagingRepository>()),
    );
    gh.factory<_i1045.SendMessage>(
      () => _i1045.SendMessage(gh<_i742.MessagingRepository>()),
    );
    gh.factory<_i870.MarkThreadAsRead>(
      () => _i870.MarkThreadAsRead(gh<_i742.MessagingRepository>()),
    );
    gh.factory<_i462.FatigueDashboardBloc>(
      () => _i462.FatigueDashboardBloc(gh<_i358.WatchClientFatigueData>()),
    );
    gh.factory<_i97.ChatThreadBloc>(
      () => _i97.ChatThreadBloc(
        gh<_i407.WatchThread>(),
        gh<_i1045.SendMessage>(),
        gh<_i870.MarkThreadAsRead>(),
      ),
    );
    gh.factory<_i952.ReadinessBloc>(
      () => _i952.ReadinessBloc(
        gh<_i320.CheckTodayReadiness>(),
        gh<_i535.SubmitReadiness>(),
      ),
    );
    gh.factory<_i822.CreateProgression>(
      () => _i822.CreateProgression(gh<_i1031.ProgressionsRepository>()),
    );
    gh.factory<_i314.AddProgressionLevel>(
      () => _i314.AddProgressionLevel(gh<_i1031.ProgressionsRepository>()),
    );
    gh.factory<_i421.ReorderProgressionLevels>(
      () => _i421.ReorderProgressionLevels(gh<_i1031.ProgressionsRepository>()),
    );
    gh.factory<_i433.WatchCoachProgressions>(
      () => _i433.WatchCoachProgressions(gh<_i1031.ProgressionsRepository>()),
    );
    gh.factory<_i634.WatchProgressionLevels>(
      () => _i634.WatchProgressionLevels(gh<_i1031.ProgressionsRepository>()),
    );
    gh.factory<_i821.WatchClientProgressions>(
      () => _i821.WatchClientProgressions(gh<_i1031.ProgressionsRepository>()),
    );
    gh.factory<_i187.OverrideClientProgressionLevel>(
      () => _i187.OverrideClientProgressionLevel(
        gh<_i1031.ProgressionsRepository>(),
      ),
    );
    gh.factory<_i655.UpdateClientProgressionStatus>(
      () => _i655.UpdateClientProgressionStatus(
        gh<_i1031.ProgressionsRepository>(),
      ),
    );
    gh.factory<_i901.ClientProgressionsBloc>(
      () => _i901.ClientProgressionsBloc(gh<_i821.WatchClientProgressions>()),
    );
    gh.factory<_i918.ProgressionsListBloc>(
      () => _i918.ProgressionsListBloc(
        gh<_i433.WatchCoachProgressions>(),
        gh<_i797.AuthBloc>(),
      ),
    );
    gh.factory<_i459.ProgressionBuilderBloc>(
      () => _i459.ProgressionBuilderBloc(
        gh<_i634.WatchProgressionLevels>(),
        gh<_i314.AddProgressionLevel>(),
        gh<_i421.ReorderProgressionLevels>(),
      ),
    );
    gh.factory<_i1031.BillingBloc>(
      () => _i1031.BillingBloc(
        gh<_i583.WatchSubscriptionStatus>(),
        gh<_i488.CreateCheckoutSession>(),
      ),
    );
    gh.factory<_i933.RosterBloc>(
      () => _i933.RosterBloc(gh<_i193.WatchMyClients>(), gh<_i797.AuthBloc>()),
    );
    gh.factory<_i218.GenerateInviteCode>(
      () => _i218.GenerateInviteCode(
        gh<_i921.CoachingRepository>(),
        gh<_i575.CheckSubscriptionStatus>(),
      ),
    );
    gh.factory<_i198.UnreadBadgeBloc>(
      () => _i198.UnreadBadgeBloc(gh<_i82.WatchUnreadCount>()),
    );
    gh.factory<_i661.InviteBloc>(
      () => _i661.InviteBloc(
        gh<_i218.GenerateInviteCode>(),
        gh<_i797.AuthBloc>(),
      ),
    );
    return this;
  }
}

class _$SupabaseModule extends _i106.SupabaseModule {}
