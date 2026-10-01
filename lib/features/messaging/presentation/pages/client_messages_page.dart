import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:ironlink/features/messaging/presentation/pages/chat_thread_page.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class ClientMessagesPage extends StatefulWidget {
  const ClientMessagesPage({super.key});

  @override
  State<ClientMessagesPage> createState() => _ClientMessagesPageState();
}

class _ClientMessagesPageState extends State<ClientMessagesPage> {
  String? coachId;
  String? coachName;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _fetchCoach();
  }

  Future<void> _fetchCoach() async {
    final authState = context.read<AuthBloc>().state;
    if (authState is AuthenticatedClient) {
      try {
        final data = await Supabase.instance.client
            .from('coach_clients')
            .select('coach_id, profiles!coach_clients_coach_id_fkey(full_name)')
            .eq('client_id', authState.user.id)
            .eq('status', 'active')
            .maybeSingle();

        if (data != null) {
          setState(() {
            coachId = data['coach_id'] as String;
            coachName = data['profiles']['full_name'] as String;
            isLoading = false;
          });
          return;
        }
      } catch (e) {
        debugPrint('Error fetching coach: $e');
      }
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    if (coachId == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Messages')),
        body: const Center(
          child: Text(
            'No active coach found. Wait for an invite or contact support.',
          ),
        ),
      );
    }

    final authState = context.read<AuthBloc>().state;
    final currentUserId = (authState is AuthenticatedClient)
        ? authState.user.id
        : '';

    return ChatThreadPage(
      currentUserId: currentUserId,
      peerId: coachId!,
      peerName: coachName ?? 'Coach',
    );
  }
}
