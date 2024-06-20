import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_upgraded_version/utils/custom_functions.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/settings_screen/screen/settings_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: CustomFunctions.isLight(context)
          ? Color(0xFFd5f7f7)
          : Color(0xFF222831),
      title: Text(
        'TicTac toe',
        style: TextStyle(
          color: CustomFunctions.isLight(context)
              ? Colors.cyan
              : Color(0xFFEEEEEE),
          fontWeight: FontWeight.w700,
          fontSize: 25,
        ),
      ),
      centerTitle: false,
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 10.0),
          child: GestureDetector(
            onTap: () => Navigator.push(
              context,
              CupertinoPageRoute(
                builder: (BuildContext context) => const SettingsScreen(),
              ),
            ),
            child: SizedBox(
              height: 50,
              width: 50,
              child: Icon(
                Icons.settings,
                color:
                    CustomFunctions.isLight(context) ? null : Color(0xFFEEEEEE),
              ),
            ),
          ),
        )
      ],
    );
  }
}
