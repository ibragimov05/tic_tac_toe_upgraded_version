import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class RestartButton extends StatelessWidget {
  final Function() onRestartTapped;

  const RestartButton({
    super.key,
    required this.onRestartTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: onRestartTapped,
        child: Container(
          decoration: BoxDecoration(
              color: const Color(0xFFC9F9FC),
              borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Center(
              child: Text(
                'Restart',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
