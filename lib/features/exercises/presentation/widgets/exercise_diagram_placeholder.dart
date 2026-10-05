import 'package:flutter/material.dart';
import '../../../../core/theme/app_colors.dart';

class ExerciseDiagramPlaceholder extends StatelessWidget {
  final String exerciseName;
  final double width;
  final double height;

  const ExerciseDiagramPlaceholder({
    Key? key,
    required this.exerciseName,
    this.width = double.infinity,
    this.height = 200,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColors>()!;

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: colors.surface1,
        border: Border.all(color: colors.surface2, width: 1),
      ),
      child: Stack(
        children: [
          // Background grid to feel like a technical diagram
          Positioned.fill(
            child: CustomPaint(
              painter: _GridPainter(colors.surface2.withOpacity(0.3)),
            ),
          ),
          
          // Two-pose line illustration 
          Positioned.fill(
            child: CustomPaint(
              painter: _StickFigurePainter(colors.accent, colors.textSecondary),
            ),
          ),
          
          // Label
          Positioned(
            bottom: 12,
            left: 12,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
              color: colors.background,
              child: Text(
                'DIAGRAM: $exerciseName',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: colors.textSecondary,
                  letterSpacing: 1.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _GridPainter extends CustomPainter {
  final Color gridColor;
  _GridPainter(this.gridColor);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = gridColor
      ..strokeWidth = 1;
      
    const step = 20.0;
    
    for (double i = 0; i < size.width; i += step) {
      canvas.drawLine(Offset(i, 0), Offset(i, size.height), paint);
    }
    for (double i = 0; i < size.height; i += step) {
      canvas.drawLine(Offset(0, i), Offset(size.width, i), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

class _StickFigurePainter extends CustomPainter {
  final Color activeColor;
  final Color mutedColor;
  _StickFigurePainter(this.activeColor, this.mutedColor);

  @override
  void paint(Canvas canvas, Size size) {
    // A stylized, technical stick figure representing start and end pose
    // End Pose (Active, Solid)
    final activePaint = Paint()
      ..color = activeColor
      ..strokeWidth = 3
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;
      
    // Start Pose (Muted, Dashed/Faded)
    final mutedPaint = Paint()
      ..color = mutedColor.withOpacity(0.4)
      ..strokeWidth = 2
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final center = Offset(size.width / 2, size.height / 2);
    
    // Draw Start Pose (e.g. bottom of a pullup) slightly to the left
    final startHead = center.translate(-40, 20);
    canvas.drawCircle(startHead, 8, mutedPaint);
    canvas.drawLine(startHead.translate(0, 8), startHead.translate(0, 40), mutedPaint); // spine
    canvas.drawLine(startHead.translate(0, 16), startHead.translate(-20, 0), mutedPaint); // arm L
    canvas.drawLine(startHead.translate(0, 16), startHead.translate(20, 0), mutedPaint); // arm R
    canvas.drawLine(startHead.translate(0, 40), startHead.translate(-15, 70), mutedPaint); // leg L
    canvas.drawLine(startHead.translate(0, 40), startHead.translate(15, 70), mutedPaint); // leg R

    // Draw End Pose (e.g. top of a pullup) slightly to the right
    final endHead = center.translate(20, -20);
    canvas.drawCircle(endHead, 8, activePaint);
    canvas.drawLine(endHead.translate(0, 8), endHead.translate(0, 40), activePaint); // spine
    canvas.drawLine(endHead.translate(0, 16), endHead.translate(-15, 20), activePaint); // arm L
    canvas.drawLine(endHead.translate(0, 16), endHead.translate(15, 20), activePaint); // arm R
    canvas.drawLine(endHead.translate(0, 40), endHead.translate(-15, 70), activePaint); // leg L
    canvas.drawLine(endHead.translate(0, 40), endHead.translate(15, 70), activePaint); // leg R
    
    // Motion Arrow between them
    final arrowPaint = Paint()
      ..color = activeColor.withOpacity(0.5)
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    
    final path = Path()
      ..moveTo(startHead.dx + 10, startHead.dy)
      ..quadraticBezierTo(center.dx - 10, center.dy - 30, endHead.dx - 15, endHead.dy);
    canvas.drawPath(path, arrowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
