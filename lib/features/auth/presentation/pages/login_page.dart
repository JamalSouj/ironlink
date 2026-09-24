import 'package:ascent/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:ascent/features/auth/presentation/bloc/auth_event.dart';
import 'package:ascent/features/auth/presentation/bloc/auth_state.dart';
import 'package:ascent/features/auth/presentation/widgets/auth_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

/// Login page — shared between coach (web) and client (mobile).
///
/// Navigation after successful login is handled entirely by [RouterNotifier]
/// + [GoRouter.redirect]. This page never pushes routes manually.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;
    context.read<AuthBloc>().add(
      AuthEvent.signInRequested(
        email: _emailCtrl.text.trim(),
        password: _passwordCtrl.text,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final size = MediaQuery.sizeOf(context);

    return BlocListener<AuthBloc, AuthState>(
      // Only listen for error state to show the snack-bar.
      // Successful auth → GoRouter redirect handles navigation automatically.
      listenWhen: (previous, current) => current is AuthError,
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              SnackBar(
                content: Text(state.failure.message),
                backgroundColor: colorScheme.error,
                behavior: SnackBarBehavior.floating,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            );
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                colorScheme.primaryContainer,
                colorScheme.surface,
                colorScheme.secondaryContainer,
              ],
            ),
          ),
          child: SafeArea(
            child: Center(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 40,
                ),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 420),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // ── Logo / wordmark ──────────────────────────────────
                      Icon(
                        Icons.trending_up_rounded,
                        size: 56,
                        color: colorScheme.primary,
                      ),
                      const SizedBox(height: 12),
                      Text(
                        'Ascent',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall
                            ?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: colorScheme.primary,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Welcome back',
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                        ),
                      ),
                      const SizedBox(height: 40),

                      // ── Card ──────────────────────────────────────────────
                      Card(
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(24),
                          side: BorderSide(
                            color: colorScheme.outlineVariant.withValues(
                              alpha: 0.5,
                            ),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(28),
                          child: Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Sign in',
                                  style: Theme.of(context).textTheme.titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                const SizedBox(height: 24),

                                // Email
                                AuthFormField(
                                  controller: _emailCtrl,
                                  label: 'Email',
                                  icon: Icons.email_outlined,
                                  keyboardType: TextInputType.emailAddress,
                                  textInputAction: TextInputAction.next,
                                  autofillHints: const [AutofillHints.email],
                                  validator: (v) {
                                    if (v == null || v.trim().isEmpty) {
                                      return 'Email is required';
                                    }
                                    if (!v.contains('@')) {
                                      return 'Enter a valid email';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 16),

                                // Password
                                AuthFormField(
                                  controller: _passwordCtrl,
                                  label: 'Password',
                                  icon: Icons.lock_outline_rounded,
                                  obscureText: _obscurePassword,
                                  textInputAction: TextInputAction.done,
                                  autofillHints: const [AutofillHints.password],
                                  onFieldSubmitted: (_) => _submit(),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                      _obscurePassword
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                    ),
                                    onPressed: () => setState(
                                      () =>
                                          _obscurePassword = !_obscurePassword,
                                    ),
                                  ),
                                  validator: (v) {
                                    if (v == null || v.isEmpty) {
                                      return 'Password is required';
                                    }
                                    return null;
                                  },
                                ),
                                const SizedBox(height: 28),

                                // Sign in button
                                BlocBuilder<AuthBloc, AuthState>(
                                  buildWhen: (previous, current) =>
                                      current is Authenticating ||
                                      previous is Authenticating,
                                  builder: (context, state) {
                                    final isLoading = state is Authenticating;
                                    return FilledButton(
                                      onPressed: isLoading ? null : _submit,
                                      style: FilledButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: 16,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            14,
                                          ),
                                        ),
                                      ),
                                      child: isLoading
                                          ? const SizedBox(
                                              height: 22,
                                              width: 22,
                                              child:
                                                  CircularProgressIndicator.adaptive(
                                                    strokeWidth: 2.5,
                                                  ),
                                            )
                                          : const Text(
                                              'Sign in',
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w600,
                                              ),
                                            ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // ── Sign-up links ────────────────────────────────────
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'New here? ',
                            style: TextStyle(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.go('/auth/coach-signup'),
                            child: const Text('Join as Coach'),
                          ),
                          Text(
                            '·',
                            style: TextStyle(
                              color: colorScheme.onSurfaceVariant,
                            ),
                          ),
                          TextButton(
                            onPressed: () => context.go('/auth/client-signup'),
                            child: const Text('Join as Client'),
                          ),
                        ],
                      ),

                      // Bottom padding — leaves breathing room on small screens
                      SizedBox(height: size.height * 0.05),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
