import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import 'package:go_router/go_router.dart';

class SessionSummaryPage extends StatefulWidget {
  final bool unlockedProgression;
  const SessionSummaryPage({Key? key, this.unlockedProgression = true}) : super(key: key);

  @override
  State<SessionSummaryPage> createState() => _SessionSummaryPageState();
}

class _SessionSummaryPageState extends State<SessionSummaryPage> {
  bool _hapticFired = false;

  void _fireHaptic() {
    if (!_hapticFired) {
      HapticFeedback.heavyImpact();
      _hapticFired = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;
    final disableAnimations = MediaQuery.disableAnimationsOf(context);

    // If reduced motion is on, we skip all delays and heavy scaling
    final durationMultiplier = disableAnimations ? 0.0 : 1.0;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              Text('SESSION COMPLETE', style: textTheme.labelLarge?.copyWith(letterSpacing: 2, color: colors.success))
                  .animate().fadeIn(duration: 300.ms * durationMultiplier).slideY(begin: disableAnimations ? 0 : 0.2, curve: Curves.easeOut),
              const SizedBox(height: 48),

              // Summary Stats
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _StatNode('VOLUME', '4,200', colors).animate(delay: 200.ms * durationMultiplier).fadeIn(duration: disableAnimations ? 0.ms : 200.ms),
                  _StatNode('SETS', '18', colors).animate(delay: 300.ms * durationMultiplier).fadeIn(duration: disableAnimations ? 0.ms : 200.ms),
                  _StatNode('DURATION', '64m', colors).animate(delay: 400.ms * durationMultiplier).fadeIn(duration: disableAnimations ? 0.ms : 200.ms),
                ],
              ),

              const SizedBox(height: 64),

              // Unlock Showcase
              if (widget.unlockedProgression)
                Column(
                  children: [
                    Text('PROGRESSION UNLOCKED', style: textTheme.labelSmall?.copyWith(color: colors.textSecondary))
                        .animate(delay: 800.ms * durationMultiplier).fadeIn(duration: disableAnimations ? 0.ms : 200.ms),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(24),
                      decoration: BoxDecoration(
                        color: colors.surface1,
                        border: Border.all(color: colors.accent, width: 2), // Glow/Highlight
                        // Chanel Rule: Drop shadow removed entirely. We rely purely on the crisp border and Rive/Animate scaling.
                      ),
                      child: Column(
                        children: [
                          Icon(Icons.lock_open, color: colors.accent, size: 32)
                              .animate(
                                delay: 1000.ms * durationMultiplier,
                                onPlay: (controller) => _fireHaptic(),
                              ).scale(curve: Curves.elasticOut, begin: disableAnimations ? const Offset(1,1) : const Offset(0.5, 0.5)),
                          const SizedBox(height: 12),
                          Text('Straddle Front Lever', style: textTheme.titleLarge),
                        ],
                      ),
                    ).animate(delay: 800.ms * durationMultiplier).shimmer(duration: disableAnimations ? 0.ms : 1000.ms, color: colors.accent.withOpacity(0.5)),
                  ],
                ),
              
              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: () => context.go('/client/today'),
                  child: const Text('FINISH'),
                ),
              ).animate(delay: 1500.ms * durationMultiplier).fadeIn(duration: disableAnimations ? 0.ms : 200.ms),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatNode extends StatelessWidget {
  final String label;
  final String value;
  final AppColors colors;
  const _StatNode(this.label, this.value, this.colors);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: AppTextStyles.dataStyle(colors, fontSize: 32)),
        const SizedBox(height: 8),
        Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: colors.textSecondary)),
      ],
    );
  }
}
