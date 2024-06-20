import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';

class CustomFunctions {
  static bool checkFading({
    required bool isXTurn,
    required int row,
    required int col,
    required List<int>? fadingIconX,
    required List<int>? fadingIconO,
  }) {
    if (isXTurn) {
      return fadingIconX != null &&
          fadingIconX[0] == row &&
          fadingIconX[1] == col;
    } else {
      return fadingIconO != null &&
          fadingIconO[0] == row &&
          fadingIconO[1] == col;
    }
  }

  static bool isLight(BuildContext context) {
    if (AdaptiveTheme.of(context).mode.isLight) {
      return true;
    }
    return false;
  }
}
