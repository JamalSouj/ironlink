import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/presentation/widgets/state_views.dart';

// Dummy BLoC states to simulate the "already wired up" architecture
abstract class TodayState {}
class TodayLoading extends TodayState {}
class TodayError extends TodayState { final String message; TodayError(this.message); }
class TodayEmpty extends TodayState {}
class TodayLoaded extends TodayState {
  final String exerciseName;
  final int currentSet;
  final int totalSets;
  final String targetReps;
  final String targetLoad;
  TodayLoaded({required this.exerciseName, required this.currentSet, required this.totalSets, required this.targetReps, required this.targetLoad});
}

class ClientTodayPage extends StatefulWidget {
  final String clientId;
  const ClientTodayPage({Key? key, required this.clientId}) : super(key: key);

  @override
  State<ClientTodayPage> createState() => _ClientTodayPageState();
}

class _ClientTodayPageState extends State<ClientTodayPage> {
  // Simulate state
  TodayState state = TodayLoaded(
    exerciseName: 'Weighted Pull-Up',
    currentSet: 2,
    totalSets: 4,
    targetReps: '5',
    targetLoad: '45kg',
  );

  void completeSet() {
    if (state is TodayLoaded) {
      final loaded = state as TodayLoaded;
      if (loaded.currentSet < loaded.totalSets) {
        setState(() {
          state = TodayLoaded(
            exerciseName: loaded.exerciseName,
            currentSet: loaded.currentSet + 1,
            totalSets: loaded.totalSets,
            targetReps: loaded.targetReps,
            targetLoad: loaded.targetLoad,
          );
        });
      } else {
        // Navigate to session summary
        // context.push('/client/summary');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text('Today', style: textTheme.labelLarge),
        // Chanel rule: Removed generic more_vert icon button that served no immediate purpose
      ),
      body: SafeArea(
        child: _buildBody(context, colors, textTheme),
      ),
    );
  }

  Widget _buildBody(BuildContext context, AppColors colors, TextTheme textTheme) {
    if (state is TodayLoading) return const LoadingStateView();
    if (state is TodayError) return ErrorStateView(error: (state as TodayError).message, onRetry: () {});
    if (state is TodayEmpty) return EmptyStateView(message: 'Rest day.', actionLabel: 'START FREESTYLE', onAction: () {});

    final loaded = state as TodayLoaded;
    final disableAnimations = MediaQuery.disableAnimationsOf(context);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 32),
          // Hero Exercise Name
          Text(loaded.exerciseName, style: textTheme.displaySmall),
          const SizedBox(height: 48),

          // Core Data in Monospace
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _HeroDataNode(colors, label: 'TARGET REPS', value: loaded.targetReps),
              _HeroDataNode(colors, label: 'TARGET LOAD', value: loaded.targetLoad),
            ],
          ),
          
          const Spacer(),

          // Set Progress Indicator (Marks, not a bar)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(loaded.totalSets, (index) {
              final isCompleted = index < loaded.currentSet;
              final isCurrent = index == loaded.currentSet;
              
              Widget mark = Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 32,
                height: 8,
                decoration: BoxDecoration(
                  color: isCompleted ? colors.success : colors.surface2,
                  border: isCurrent ? Border.all(color: colors.accent, width: 2) : null,
                ),
              );

              // Phase A Animation: fast confirm on complete
              if (!disableAnimations && isCompleted && index == loaded.currentSet - 1) {
                mark = mark.animate()
                  .scale(duration: 150.ms, curve: Curves.easeOut, begin: const Offset(1.2, 1.2), end: const Offset(1, 1))
                  .tint(color: Colors.white, duration: 150.ms);
              }
              
              return mark;
            }),
          ),
          
          const SizedBox(height: 32),

          // Set Logging Area (Thumb reachable)
          _SetLoggingControls(
            colors: colors,
            textTheme: textTheme,
            onLogSet: completeSet,
          ),
        ],
      ),
    );
  }
}

class _HeroDataNode extends StatelessWidget {
  final AppColors colors;
  final String label;
  final String value;
  const _HeroDataNode(this.colors, {required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall?.copyWith(color: colors.textSecondary)),
        const SizedBox(height: 8),
        Text(value, style: AppTextStyles.dataStyle(colors, fontSize: 48, fontWeight: FontWeight.w400)),
      ],
    );
  }
}

class _SetLoggingControls extends StatefulWidget {
  final AppColors colors;
  final TextTheme textTheme;
  final VoidCallback onLogSet;
  const _SetLoggingControls({required this.colors, required this.textTheme, required this.onLogSet});

  @override
  State<_SetLoggingControls> createState() => _SetLoggingControlsState();
}

class _SetLoggingControlsState extends State<_SetLoggingControls> {
  int reps = 5;
  double rpe = 7.0;
  double load = 45.0;

  @override
  Widget build(BuildContext context) {
    final effortColor = rpe >= 9.0 ? widget.colors.effortHigh : (rpe >= 7.0 ? widget.colors.effortLow : widget.colors.surface2);

    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: widget.colors.surface1,
        border: Border.all(color: widget.colors.surface2),
      ),
      child: Column(
        children: [
          // RPE Horizontal Picker
          Row(
            children: [
              Text('RPE', style: widget.textTheme.labelMedium),
              const SizedBox(width: 16),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: effortColor,
                    inactiveTrackColor: widget.colors.surface2,
                    thumbColor: effortColor,
                    trackHeight: 2,
                  ),
                  child: Slider(
                    value: rpe,
                    min: 5,
                    max: 10,
                    divisions: 10,
                    onChanged: (val) => setState(() => rpe = val),
                  ),
                ),
              ),
              SizedBox(
                width: 40,
                child: Text(
                  rpe.toString(), 
                  style: AppTextStyles.dataStyle(widget.colors, fontSize: 18, fontWeight: FontWeight.bold).copyWith(color: effortColor),
                  textAlign: TextAlign.right,
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          // Load & Reps Quick Adjust
          Row(
            children: [
              _QuickAdjuster(
                colors: widget.colors,
                label: 'LOAD (KG)',
                value: load.toString(),
                onMinus: () => setState(() => load -= 2.5),
                onPlus: () => setState(() => load += 2.5),
              ),
              const SizedBox(width: 16),
              _QuickAdjuster(
                colors: widget.colors,
                label: 'REPS',
                value: reps.toString(),
                onMinus: () => setState(() => reps > 0 ? reps-- : 0),
                onPlus: () => setState(() => reps++),
              ),
            ],
          ),
          const SizedBox(height: 32),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: ElevatedButton(
              onPressed: widget.onLogSet,
              style: ElevatedButton.styleFrom(
                backgroundColor: widget.colors.accent,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(2)),
              ),
              child: const Text('LOG SET'),
            ),
          ),
        ],
      ),
    );
  }
}

class _QuickAdjuster extends StatelessWidget {
  final AppColors colors;
  final String label;
  final String value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;

  const _QuickAdjuster({required this.colors, required this.label, required this.value, required this.onMinus, required this.onPlus});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: Theme.of(context).textTheme.labelSmall),
          const SizedBox(height: 8),
          Container(
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(color: colors.surface2),
              color: colors.background,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(icon: Icon(Icons.remove, size: 20, color: colors.textSecondary), onPressed: onMinus),
                Text(value, style: AppTextStyles.dataStyle(colors, fontSize: 20)),
                IconButton(icon: Icon(Icons.add, size: 20, color: colors.textSecondary), onPressed: onPlus),
              ],
            ),
          )
        ],
      ),
    );
  }
}
