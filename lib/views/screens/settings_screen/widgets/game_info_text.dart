import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_upgraded_version/utils/custom_functions.dart';

class GameInfoText extends StatefulWidget {
  const GameInfoText({super.key});

  @override
  State<GameInfoText> createState() => _GameInfoTextState();
}

class _GameInfoTextState extends State<GameInfoText> {
  final TextStyle titleStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w700,
  );

  final TextStyle descriptionStyle = const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  final Color titleLightColor = Colors.grey;

  final Color descriptionLightColor = Colors.grey.withOpacity(0.6);

  Color titleDarkColor = Colors.white.withOpacity(0.8);

  final Color descriptionDarkColor = Colors.white.withOpacity(0.5);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          context.tr('enhanced_st.title'),
          style: titleStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? titleLightColor
                : titleDarkColor,
          ),
        ),
        Text(
          context.tr('enhanced_st.description'),
          style: descriptionStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? descriptionLightColor
                : descriptionDarkColor,
          ),
        ),
        Text(
          context.tr('improved_pr.title'),
          style: titleStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? titleLightColor
                : titleDarkColor,
          ),
        ),
        Text(
          context.tr('improved_pr.description'),
          style: descriptionStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? descriptionLightColor
                : descriptionDarkColor,
          ),
        ),
        Text(
          context.tr('increased_focus.title'),
          style: titleStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? titleLightColor
                : titleDarkColor,
          ),
        ),
        Text(
          context.tr('increased_focus.description'),
          style: descriptionStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? descriptionLightColor
                : descriptionDarkColor,
          ),
        ),
        Text(
          context.tr('better_memory.title'),
          style: titleStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? titleLightColor
                : titleDarkColor,
          ),
        ),
        Text(
          context.tr('better_memory.description'),
          style: descriptionStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? descriptionLightColor
                : descriptionDarkColor,
          ),
        ),
        Text(
          context.tr('promotes_creativity.title'),
          style: titleStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? titleLightColor
                : titleDarkColor,
          ),
        ),
        Text(
          context.tr('promotes_creativity.description'),
          style: descriptionStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? descriptionLightColor
                : descriptionDarkColor,
          ),
        ),
        Text(
          context.tr('encourages_fair_play.title'),
          style: titleStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? titleLightColor
                : titleDarkColor,
          ),
        ),
        Text(
          context.tr('encourages_fair_play.description'),
          style: descriptionStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? descriptionLightColor
                : descriptionDarkColor,
          ),
        ),
        Text(
          context.tr('educational_value.title'),
          style: titleStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? titleLightColor
                : titleDarkColor,
          ),
        ),
        Text(
          context.tr('educational_value.description'),
          style: descriptionStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? descriptionLightColor
                : descriptionDarkColor,
          ),
        ),
        Text(
          context.tr('entertainment_replayability.title'),
          style: titleStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? titleLightColor
                : titleDarkColor,
          ),
        ),
        Text(
          context.tr('entertainment_replayability.description'),
          style: descriptionStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? descriptionLightColor
                : descriptionDarkColor,
          ),
        ),
        Text(
          context.tr('reduces_stalemate_frustration.title'),
          style: titleStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? titleLightColor
                : titleDarkColor,
          ),
        ),
        Text(
          context.tr('reduces_stalemate_frustration.description'),
          style: descriptionStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? descriptionLightColor
                : descriptionDarkColor,
          ),
        ),
        Text(
          context.tr('social_interaction.title'),
          style: titleStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? titleLightColor
                : titleDarkColor,
          ),
        ),
        Text(
          context.tr('social_interaction.description'),
          style: descriptionStyle.copyWith(
            color: CustomFunctions.isLight(context)
                ? descriptionLightColor
                : descriptionDarkColor,
          ),
        ),
        const SizedBox(height: kToolbarHeight),
      ],
    );
  }
}
