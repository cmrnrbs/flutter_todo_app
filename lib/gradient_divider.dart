import 'package:flutter/material.dart';

class GradientDivider extends StatelessWidget {
  final bool isHorizontal;
  final double size;
  final double thickness;
  final double start;
  final double end;
  final Gradient gradient;
  final Color color;

  const GradientDivider(
      {Key? key,
      required this.isHorizontal,
      required this.size,
      required this.thickness,
      required this.start,
      required this.end,
      required this.gradient,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isHorizontal ? thickness : end,
      height: isHorizontal ? end : thickness,
      decoration: BoxDecoration(
        color: color,
        gradient: gradient,
        border: Border.all(color: Colors.transparent, width: 1),
      ),
    );
  }
}
