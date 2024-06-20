import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tic_tac_toe_upgraded_version/utils/custom_functions.dart';

class ScoreTable extends StatelessWidget {
  final int xScore;
  final int oScore;

  const ScoreTable({
    super.key,
    required this.xScore,
    required this.oScore,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Column(
        children: [
          Text(
            'Scores',
            style: TextStyle(
              color: CustomFunctions.isLight(context)
                  ? Colors.cyan
                  : Color(0xFFEEEEEE),
              fontSize: 30,
              fontWeight: FontWeight.w600,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SvgPicture.asset(
                'assets/icons/x.svg',
                height: 40,
                width: 40,
              ),
              Container(
                width: 140,
                height: 50,
                decoration: BoxDecoration(
                  color: CustomFunctions.isLight(context)
                      ? Colors.white
                      : Color(0xFF222831),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$xScore - $oScore',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontSize: 25,
                        color: CustomFunctions.isLight(context)
                            ? Colors.cyan
                            : Color(0xFFEEEEEE),
                      ),
                    ),
                  ],
                ),
              ),
              SvgPicture.asset(
                'assets/icons/o.svg',
                height: 40,
                width: 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
