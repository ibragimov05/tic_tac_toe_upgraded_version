import 'dart:async';

import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_upgraded_version/utils/custom_functions.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/main_screen/widgets/center_left_confetti.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/main_screen/widgets/center_right_confetti.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/main_screen/widgets/custom_app_bar.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/main_screen/widgets/custom_board.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/main_screen/widgets/new_game_button.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/main_screen/widgets/restart_button.dart';
import 'package:tic_tac_toe_upgraded_version/views/screens/main_screen/widgets/score_table.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late ConfettiController _controllerLeft;
  late ConfettiController _controllerRight;

  @override
  void initState() {
    super.initState();
    _controllerLeft = ConfettiController(duration: const Duration(seconds: 1));
    _controllerRight = ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  void dispose() {
    _controllerLeft.dispose();
    _controllerRight.dispose();
    super.dispose();
  }

  final List<List<String>> _board = List.generate(
    3,
    (_) => List.filled(3, ''),
  );

  bool _isXTurn = true;
  bool _isGameOver = false;

  List<List<int>> xValues = [];
  List<List<int>> oValues = [];

  List<int>? _fadingIconX;
  List<int>? _fadingIconO;

  Timer? _flashingTimer;
  bool _isFlashing = false;

  List<List<int>> wonIndexes = [];

  int _xScore = 0;
  int _oScore = 0;

  void _placeMark(int row, int col) {
    if (_board[row][col].isEmpty && !_isGameOver) {
      _lastTappedRemover(row, col);
      _board[row][col] = _isXTurn ? 'x' : 'o';
      _isXTurn = !_isXTurn;
      setState(() {});
    }
    _checkGame();
  }

  void _lastTappedRemover(int row, int col) {
    if (_isXTurn) {
      xValues.add([row, col]);
      if (xValues.length == 3) {
        _fadingIconX = xValues[0];
        setState(() {});
      } else if (xValues.length == 4) {
        final List<int> removedValue = xValues.removeAt(0);
        _board[removedValue[0]][removedValue[1]] = '';
        _fadingIconX = xValues[0];
      }
    } else {
      oValues.add([row, col]);
      if (oValues.length == 3) {
        _fadingIconO = oValues[0];
        setState(() {});
      } else if (oValues.length == 4) {
        final List<int> removedValue = oValues.removeAt(0);
        _board[removedValue[0]][removedValue[1]] = '';
        _fadingIconO = oValues[0];
      }
    }
  }

  void _onNewGameOrRestartTapped(bool isRestart) {
    if (!isRestart) {
      _oScore = 0;
      _xScore = 0;
    }
    _isXTurn = true;
    xValues = [];
    oValues = [];
    _isGameOver = false;

    _isFlashing = false;
    _fadingIconX = null;
    _fadingIconO = null;

    for (int i = 0; i < _board.length; i++) {
      _board[i] = ['', '', ''];
    }
    setState(() {});
    _stopFlashing();
  }

  void _checkGame() {
    bool isXWon = false;
    bool isOWon = false;

    for (int i = 0; i < 3; i++) {
      if (_board[i][0] == 'x' && _board[i][1] == 'x' && _board[i][2] == 'x') {
        isXWon = true;
        wonIndexes = [
          [i, 0],
          [i, 1],
          [i, 2]
        ];
        break;
      } else if (_board[0][i] == 'x' &&
          _board[1][i] == 'x' &&
          _board[2][i] == 'x') {
        isXWon = true;
        wonIndexes = [
          [0, i],
          [1, i],
          [2, i]
        ];
        break;
      } else if (_board[i][0] == 'o' &&
          _board[i][1] == 'o' &&
          _board[i][2] == 'o') {
        isOWon = true;
        wonIndexes = [
          [i, 0],
          [i, 1],
          [i, 2]
        ];
        break;
      } else if (_board[0][i] == 'o' &&
          _board[1][i] == 'o' &&
          _board[2][i] == 'o') {
        isOWon = true;
        wonIndexes = [
          [0, i],
          [1, i],
          [2, i]
        ];
        break;
      }
    }

    if (!(isXWon || isOWon)) {
      if (_board[0][0] == 'x' && _board[1][1] == 'x' && _board[2][2] == 'x') {
        isXWon = true;
        wonIndexes = [
          [0, 0],
          [1, 1],
          [2, 2]
        ];
      } else if (_board[0][0] == 'o' &&
          _board[1][1] == 'o' &&
          _board[2][2] == 'o') {
        isOWon = true;
        wonIndexes = [
          [0, 0],
          [1, 1],
          [2, 2]
        ];
      }
    }

    if (isXWon || isOWon) {
      if (isXWon) {
        _controllerLeft.play();
        _xScore++;
      } else {
        _controllerRight.play();
        _oScore++;
      }
      _isGameOver = true;
      _startFlashing();
    }
  }

  void _startFlashing() {
    _isFlashing = true;
    _flashingTimer =
        Timer.periodic(const Duration(milliseconds: 250), (Timer timer) {
      _isFlashing = !_isFlashing;
      setState(() {});
    });
  }

  void _stopFlashing() {
    _flashingTimer?.cancel();
    _isFlashing = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomFunctions.isLight(context) ? Color(0xFFedfcfc) : Color(0xFF31363F),
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppBar(),
      ),
      body: Stack(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ScoreTable(
                xScore: _xScore,
                oScore: _oScore,
              ),
              Center(
                child: Container(
                  height: 360,
                  width: 360,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.white,
                    border: const Border(
                      bottom: BorderSide(
                        width: 15,
                        color: Color(0xFF000000),
                      ),
                      left: BorderSide(
                        width: 15,
                        color: Color(0xFF000000),
                      ),
                      right: BorderSide(
                        width: 5,
                        color: Color(0xFF000000),
                      ),
                      top: BorderSide(
                        width: 5,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  child: GridView.builder(
                    itemCount: 9,
                    padding: const EdgeInsets.all(10),
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1.2,
                      mainAxisExtent: 100,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      int row = index ~/ 3;
                      int col = index % 3;
                      bool isFlashing = _isFlashing &&
                          wonIndexes.any(
                            (element) => element[0] == row && element[1] == col,
                          );
                      return CustomBoard(
                        row: row,
                        col: col,
                        isTapped: _board[row][col],
                        isFlashing: isFlashing,
                        isGameOver: _isGameOver,
                        isFadingIcon: CustomFunctions.checkFading(
                            isXTurn: _isXTurn,
                            col: col,
                            row: row,
                            fadingIconX: _fadingIconX,
                            fadingIconO: _fadingIconO),
                        onTap: _placeMark,
                      );
                    },
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  RestartButton(
                    onRestartTapped: () => _onNewGameOrRestartTapped(true),
                  ),
                  NewGameButton(
                    onNewGameTapped: () => _onNewGameOrRestartTapped(false),
                  )
                ],
              ),
            ],
          ),
          CenterLeftConfetti(controllerLeft: _controllerLeft),
          CenterRightConfetti(controllerRight: _controllerRight),
        ],
      ),
    );
  }
}
