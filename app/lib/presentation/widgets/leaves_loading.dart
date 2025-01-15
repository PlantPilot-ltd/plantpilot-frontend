import 'package:app/presentation/index.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LeavesLoading extends StatelessWidget {
  final double size;

  const LeavesLoading({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return Lottie.asset(
      AppAnimations.leavesLoading,
      width: size,
      height: size,
      fit: BoxFit.contain,
      repeat: true,
      animate: true,
    );
  }
}
