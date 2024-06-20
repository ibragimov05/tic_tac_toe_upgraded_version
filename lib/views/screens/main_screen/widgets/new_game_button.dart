import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class NewGameButton extends StatelessWidget {
  final Function() onNewGameTapped;

  const NewGameButton({
    super.key,
    required this.onNewGameTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: GestureDetector(
        onTap: onNewGameTapped,
        child: Container(
          decoration: BoxDecoration(
            color: const Color(0xFFC9F9FC),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Center(
              child: Text(
                context.tr('new_game'),
                style: TextStyle(
                  color: const Color(0xFF808080).withOpacity(0.7),
                  fontWeight: FontWeight.w800,
                  fontSize: 22,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
