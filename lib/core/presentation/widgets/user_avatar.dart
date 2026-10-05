import 'package:flutter/material.dart';
import '../../theme/app_colors.dart';
import '../../theme/app_text_styles.dart';

class UserAvatar extends StatelessWidget {
  final String userId;
  final String name;
  final double radius;
  final String? imageUrl;

  const UserAvatar({
    Key? key,
    required this.userId,
    required this.name,
    this.radius = 20.0,
    this.imageUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;
    final textTheme = Theme.of(context).textTheme;

    if (imageUrl != null && imageUrl!.isNotEmpty) {
      return CircleAvatar(
        radius: radius,
        backgroundImage: NetworkImage(imageUrl!),
        backgroundColor: colors.surface2,
      );
    }

    // Deterministic color from accent family based on userId
    final palette = [
      colors.accent,
      colors.accent.withOpacity(0.8),
      colors.accent.withBlue(colors.accent.blue - 40).withOpacity(0.9), // Darker variant
      colors.accent.withRed(colors.accent.red + 30).withOpacity(0.9), // Warmer variant
    ];
    
    final colorIndex = userId.hashCode.abs() % palette.length;
    final backgroundColor = palette[colorIndex];
    
    final initial = name.isNotEmpty ? name.substring(0, 1).toUpperCase() : '?';

    return CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      child: Text(
        initial,
        style: textTheme.titleMedium?.copyWith(
          color: Colors.white,
          fontSize: radius * 0.9,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
