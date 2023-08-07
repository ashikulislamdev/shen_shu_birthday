import 'dart:math';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';

class CustomConfittiWIdget extends StatelessWidget {
  const CustomConfittiWIdget({
    super.key,
    required ConfettiController controllerCenterTop,
  }) : _controllerCenterTop = controllerCenterTop;

  final ConfettiController _controllerCenterTop;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        confettiController: _controllerCenterTop,
        blastDirection: pi / 2, // radial value - LEFT
        particleDrag: 0.05, // apply drag to the confetti
        emissionFrequency: 0.05, // how often it should emit
        numberOfParticles: 50, // number of particles to emit
        gravity: 0.05, // gravity - or fall speed
        shouldLoop: false,
        colors: const [
          Colors.green,
          Colors.blue,
          Colors.pink
        ], // manually specify the colors to be used
        strokeWidth: 1,
        strokeColor: Colors.white,
      ),
    );
  }
}
