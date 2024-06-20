import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CenterRightConfetti extends StatelessWidget {
  final ConfettiController controllerRight;

  const CenterRightConfetti({
    super.key,
    required this.controllerRight,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: ConfettiWidget(
        confettiController: controllerRight,
        blastDirection: pi,
        particleDrag: 0.05,
        emissionFrequency: 0.05,
        numberOfParticles: 20,
        gravity: 0.05,
        shouldLoop: false,
        colors: const [Colors.blue],
        strokeWidth: 1,
        strokeColor: Colors.white,
      ),
    );
  }
}
