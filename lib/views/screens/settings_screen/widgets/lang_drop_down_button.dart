import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tic_tac_toe_upgraded_version/utils/app_constants.dart';
import 'package:tic_tac_toe_upgraded_version/utils/custom_functions.dart';

class LangDropDownButton extends StatefulWidget {
  const LangDropDownButton({super.key});

  @override
  State<LangDropDownButton> createState() => _LangDropDownButtonState();
}

class _LangDropDownButtonState extends State<LangDropDownButton> {
  String selectedLanguage = 'English';

  @override
  void initState() {
    super.initState();
    AppConstants.selectedLanguage.then(
      (value) => setState(() => selectedLanguage = value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      iconEnabledColor: CustomFunctions.isLight(context)
          ? Colors.black
          : Colors.white,
      underline: Container(),
      dropdownColor: CustomFunctions.isLight(context)
          ? const Color(0xFFdef8fa)
          : const Color(0xFF787f80),
      padding: const EdgeInsets.only(right: 10),
      value: selectedLanguage,
      onChanged: (String? newValue) {
        setState(() {
          selectedLanguage = newValue!;
        });
      },
      items:
          AppConstants.languages.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          onTap: () async {
            SharedPreferences sharedPreferences =
                await SharedPreferences.getInstance();
            if (value == 'English') {
              context.setLocale(const Locale('en'));
              sharedPreferences.setString('lang', 'English');
            } else if (value == 'Uzbek') {
              context.setLocale(const Locale('uz'));
              sharedPreferences.setString('lang', 'Uzbek');
            } else if (value == 'Russian') {
              context.setLocale(const Locale('ru'));
              sharedPreferences.setString('lang', 'Russian');
            }
          },
          value: value,
          child: Text(
            value,
            style: TextStyle(
              color: CustomFunctions.isLight(context)
                  ? Colors.black
                  : Colors.white,
              fontWeight: FontWeight.w700,
            ),
          ),
        );
      }).toList(),
    );
  }
}
