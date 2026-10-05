import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../core/theme/app_colors.dart';
import '../../core/theme/app_text_styles.dart';

class ThemePreviewScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback onToggleTheme;

  const ThemePreviewScreen({
    Key? key,
    required this.isDark,
    required this.onToggleTheme,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Get colors via ThemeExtension
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Preview'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            onPressed: onToggleTheme,
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('IRONLINK', style: textTheme.labelSmall?.copyWith(letterSpacing: 2)),
            const SizedBox(height: 8),
            Text('Typography', style: textTheme.displaySmall),
            const SizedBox(height: 24),
            _buildTypeScale(textTheme, colors),
            
            const SizedBox(height: 48),
            Text('Color Tokens', style: textTheme.displaySmall),
            const SizedBox(height: 24),
            _buildColorGrid(colors),

            const SizedBox(height: 48),
            Text('Data Components', style: textTheme.displaySmall),
            const SizedBox(height: 24),
            _buildDataCards(colors, textTheme),
            
            const SizedBox(height: 48),
            Text('Motion & Action', style: textTheme.displaySmall),
            const SizedBox(height: 24),
            _buildMotionDemo(colors, textTheme),
            const SizedBox(height: 48),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: 'Today'),
          BottomNavigationBarItem(icon: Icon(Icons.show_chart), label: 'Progress'),
          BottomNavigationBarItem(icon: Icon(Icons.chat_bubble_outline), label: 'Messages'),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: 'Profile'),
        ],
      ),
    );
  }

  Widget _buildTypeScale(TextTheme theme, AppColors colors) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _TypeRow(name: 'displayLarge', style: theme.displayLarge, text: '1RM', isData: true),
        _TypeRow(name: 'displayMedium', style: theme.displayMedium, text: '240', isData: true),
        _TypeRow(name: 'displaySmall', style: theme.displaySmall, text: 'Dashboard'),
        const Divider(height: 32),
        _TypeRow(name: 'headlineLarge', style: theme.headlineLarge, text: 'Workout Log'),
        _TypeRow(name: 'headlineMedium', style: theme.headlineMedium, text: 'Squat Progression'),
        _TypeRow(name: 'headlineSmall', style: theme.headlineSmall, text: 'Active Plan'),
        const Divider(height: 32),
        _TypeRow(name: 'titleLarge', style: theme.titleLarge, text: 'Client Roster'),
        _TypeRow(name: 'titleMedium', style: theme.titleMedium, text: 'Bench Press'),
        _TypeRow(name: 'titleSmall', style: theme.titleSmall, text: '3 sets x 5 reps'),
        const Divider(height: 32),
        _TypeRow(name: 'bodyLarge', style: theme.bodyLarge, text: 'This is body large used for standard prose and descriptions.'),
        _TypeRow(name: 'bodyMedium', style: theme.bodyMedium, text: 'This is body medium used for secondary prose and text blocks.'),
        _TypeRow(name: 'bodySmall', style: theme.bodySmall, text: 'This is body small used for captions and fine print.'),
        const Divider(height: 32),
        _TypeRow(name: 'labelLarge', style: theme.labelLarge, text: 'START WORKOUT'),
        _TypeRow(name: 'labelMedium', style: theme.labelMedium, text: 'REST 2:00'),
        _TypeRow(name: 'labelSmall', style: theme.labelSmall, text: 'RPE TARGET'),
      ],
    );
  }

  Widget _buildColorGrid(AppColors colors) {
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: 16,
      crossAxisSpacing: 16,
      childAspectRatio: 2.5,
      children: [
        _ColorSwatch(name: 'Background', color: colors.background, textColor: colors.textPrimary),
        _ColorSwatch(name: 'Surface 1 (Card)', color: colors.surface1, textColor: colors.textPrimary),
        _ColorSwatch(name: 'Surface 2 (Elev)', color: colors.surface2, textColor: colors.textPrimary),
        _ColorSwatch(name: 'Text Primary', color: colors.textPrimary, textColor: colors.background),
        _ColorSwatch(name: 'Text Secondary', color: colors.textSecondary, textColor: colors.background),
        _ColorSwatch(name: 'Accent (Action)', color: colors.accent, textColor: Colors.white),
        _ColorSwatch(name: 'Effort Low (RPE 6-7)', color: colors.effortLow, textColor: Colors.black),
        _ColorSwatch(name: 'Effort High (RPE 9-10)', color: colors.effortHigh, textColor: Colors.white),
        _ColorSwatch(name: 'Success', color: colors.success, textColor: Colors.black),
      ],
    );
  }

  Widget _buildDataCards(AppColors colors, TextTheme theme) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Back Squat', style: theme.titleMedium),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: colors.effortHigh.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(2),
                      ),
                      child: Text(
                        'RPE 9',
                        style: AppTextStyles.dataStyle(colors, fontSize: 12, fontWeight: FontWeight.bold)
                            .copyWith(color: colors.effortHigh),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _DataColumn(colors, label: 'SETS', value: '3'),
                    _DataColumn(colors, label: 'REPS', value: '5'),
                    _DataColumn(colors, label: 'LOAD (KG)', value: '180'),
                    _DataColumn(colors, label: '1RM %', value: '85%'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildMotionDemo(AppColors colors, TextTheme theme) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          child: const Text('COMPLETE SET'),
        ).animate(onPlay: (controller) => controller.repeat(reverse: true))
         .scale(duration: 200.ms, curve: Curves.easeOut, begin: const Offset(1, 1), end: const Offset(1.02, 1.02)),
        
        const SizedBox(width: 16),
        
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: colors.surface2,
            border: Border.all(color: colors.success),
            shape: BoxShape.circle,
          ),
          child: Icon(Icons.check, color: colors.success),
        ).animate(onPlay: (controller) => controller.repeat(period: const Duration(seconds: 2)))
         .scale(duration: 400.ms, curve: Curves.elasticOut, begin: const Offset(0.5, 0.5))
         .fadeIn(duration: 200.ms),
      ],
    );
  }
}

class _TypeRow extends StatelessWidget {
  final String name;
  final TextStyle? style;
  final String text;
  final bool isData;

  const _TypeRow({required this.name, required this.style, required this.text, this.isData = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.alphabetic,
        children: [
          SizedBox(
            width: 100,
            child: Text(
              name,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: Theme.of(context).extension<AppColors>()?.textSecondary,
              ),
            ),
          ),
          Expanded(
            child: Text(text, style: style),
          ),
        ],
      ),
    );
  }
}

class _ColorSwatch extends StatelessWidget {
  final String name;
  final Color color;
  final Color textColor;

  const _ColorSwatch({required this.name, required this.color, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        border: Border.all(color: Theme.of(context).extension<AppColors>()!.surface2, width: 1),
      ),
      padding: const EdgeInsets.all(12),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(
          name,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
            color: textColor,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class _DataColumn extends StatelessWidget {
  final AppColors colors;
  final String label;
  final String value;

  const _DataColumn(this.colors, {required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelSmall),
        const SizedBox(height: 4),
        Text(value, style: AppTextStyles.dataStyle(colors, fontSize: 24, fontWeight: FontWeight.w500)),
      ],
    );
  }
}
