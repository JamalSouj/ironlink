import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:ironlink/core/di/injection.dart';
import 'package:ironlink/core/utils/constants.dart';
import 'package:ironlink/features/auth/domain/entities/auth_user.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ironlink/features/auth/presentation/bloc/auth_state.dart';
import 'package:ironlink/features/billing/presentation/bloc/billing_bloc.dart';
import 'package:ironlink/features/billing/presentation/bloc/billing_event.dart';
import 'package:ironlink/features/billing/presentation/bloc/billing_state.dart';
import 'package:url_launcher/url_launcher.dart';

class BillingPage extends StatelessWidget {
  const BillingPage({super.key});

  Future<void> _launchUrl(String urlString) async {
    final url = Uri.parse(urlString);
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final authState = context.read<AuthBloc>().state;
    AuthUser? currentUser;
    if (authState is AuthenticatedCoach) {
      currentUser = authState.user;
    }

    if (currentUser == null) {
      return const Scaffold(body: Center(child: Text('Not logged in as a coach.')));
    }

    final coachId = currentUser.id;

    return BlocProvider(
      create: (context) => getIt<BillingBloc>()..add(BillingEvent.started(coachId: coachId)),
      child: Scaffold(
        appBar: AppBar(title: const Text('Billing & Subscription')),
        body: BlocConsumer<BillingBloc, BillingState>(
          listener: (context, state) {
            if (state is BillingCheckoutReady) {
              _launchUrl(state.checkoutUrl);
            } else if (state is BillingError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Error: ${state.failure.message}')));
            }
          },
          builder: (context, state) {
            return switch (state) {
              BillingInitial() || BillingLoading() => const Center(child: CircularProgressIndicator()),
              BillingCheckoutLoading() => const Center(child: CircularProgressIndicator(color: Colors.blue)),
              BillingLoaded(:final subscription) => () {
                final isPro = subscription?.isPro ?? false;
                final planName = isPro ? 'Pro' : 'Starter (Free)';
                final clientsLimit = isPro ? 'Unlimited' : '3 max';

                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Current Plan: $planName', style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              Text('Status: ${subscription?.status ?? 'active'}'),
                              const SizedBox(height: 8),
                              Text('Clients allowed: $clientsLimit'),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(height: 32),
                      if (!isPro)
                        ElevatedButton(
                          onPressed: () {
                            context.read<BillingBloc>().add(
                                  BillingEvent.checkoutRequested(
                                    priceId: dotenv.env[AppConstants.envStripeProPriceId] ?? '',
                                    redirectUrl: 'ironlink://billing',
                                  ),
                                );
                          },
                          style: ElevatedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                          child: const Text('Upgrade to Pro'),
                        ),
                      if (isPro)
                        OutlinedButton(
                          onPressed: () {
                            _launchUrl('https://billing.stripe.com/p/login/test_portal');
                          },
                          style: OutlinedButton.styleFrom(minimumSize: const Size(double.infinity, 50)),
                          child: const Text('Manage Billing (Stripe Portal)'),
                        ),
                    ],
                  ),
                );
              }(),
              _ => const Center(child: Text('An error occurred')),
            };
          },
        ),
      ),
    );
  }
}
