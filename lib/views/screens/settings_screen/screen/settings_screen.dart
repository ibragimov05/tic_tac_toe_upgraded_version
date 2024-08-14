import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fading_edge_scrollview/fading_edge_scrollview.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_upgraded_version/utils/custom_functions.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/settings_screen/widgets/game_info_text.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/settings_screen/widgets/lang_drop_down_button.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final _controller = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomFunctions.isLight(context)
          ? const Color(0xFFedfcfc)
          : const Color(0xFF31363F),
      appBar: AppBar(
        backgroundColor: CustomFunctions.isLight(context)
            ? const Color(0xFFd5f7f7)
            : const Color(0xFF222831),
        title: Text(
          context.tr('settings'),
          style: TextStyle(
            color: CustomFunctions.isLight(context)
                ? Colors.cyan
                : const Color(0xFFEEEEEE),
            fontWeight: FontWeight.w700,
            fontSize: 25,
          ),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: CustomFunctions.isLight(context)
                ? Colors.grey
                : const Color(0xFFEEEEEE),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Column(
            children: [
              Semantics(
                label: context.tr('dark_mode'),
                child: SwitchListTile(
                  activeColor: Colors.white,
                  activeTrackColor: const Color(0xFF4BD863),
                  value: AdaptiveTheme.of(context).mode.isDark,
                  inactiveThumbColor: Colors.grey,
                  inactiveTrackColor: Colors.white,
                  onChanged: (value) {
                    if (value) {
                      AdaptiveTheme.of(context).setDark();
                    } else {
                      AdaptiveTheme.of(context).setLight();
                    }
                  },
                  title: Text(
                    context.tr('dark_mode'),
                    style: TextStyle(
                      color: CustomFunctions.isLight(context)
                          ? Colors.grey
                          : const Color(0xFFEEEEEE),
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Semantics(
                label: context.tr('language'),
                child: ListTile(
                    title: Text(
                      context.tr('language'),
                      style: TextStyle(
                        color: CustomFunctions.isLight(context)
                            ? Colors.grey
                            : const Color(0xFFEEEEEE),
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    trailing: const LangDropDownButton()),
              ),
            ],
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Semantics(
                  label: context.tr('about_game'),
                  child: SizedBox(
                    width: 330,
                    child: Text(
                      context.tr('about_game'),
                      style: const TextStyle(
                        color: Colors.cyan,
                        fontWeight: FontWeight.w700,
                        fontSize: 17,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: FadingEdgeScrollView.fromSingleChildScrollView(
              gradientFractionOnStart: 0.3,
              gradientFractionOnEnd: 0.3,
              child: SingleChildScrollView(
                controller: _controller,
                child: const Padding(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0, top: 20),
                  child: GameInfoText(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
