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
              borderRadius: BorderRadius.circular(10)),
          child: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
            child: Center(
              child: Text(
                'New game',
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
