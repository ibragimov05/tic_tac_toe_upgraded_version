import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CenterLeftConfetti extends StatelessWidget {
  final ConfettiController controllerLeft;

  const CenterLeftConfetti({
    super.key,
    required this.controllerLeft,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: ConfettiWidget(
        confettiController: controllerLeft,
        blastDirection: 0,
        // Left
        particleDrag: 0.05,
        emissionFrequency: 0.05,
        numberOfParticles: 20,
        gravity: 0.05,
        shouldLoop: false,
        colors: const [Colors.red],
        strokeWidth: 1,
        strokeColor: Colors.white,
      ),
    );
  }
}
