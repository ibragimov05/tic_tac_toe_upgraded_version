import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class CustomBoard extends StatefulWidget {
  final int row;
  final int col;
  final String isTapped;
  final bool isFlashing;
  final bool isGameOver;
  final bool isFadingIcon;
  final Function(int, int) onTap;

  const CustomBoard({
    super.key,
    required this.row,
    required this.col,
    required this.isTapped,
    required this.isFlashing,
    required this.isGameOver,
    required this.isFadingIcon,
    required this.onTap,
  });

  @override
  State<CustomBoard> createState() => _CustomBoardState();
}

class _CustomBoardState extends State<CustomBoard> {
  @override
  Widget build(BuildContext context) {
    return widget.isTapped == '' && !widget.isGameOver
        ? ZoomTapAnimation(
            onTap: () {
              widget.onTap(widget.row, widget.col);
            },
            child: customContainer(),
          )
        : customContainer();
  }

  Widget customContainer() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color(0xFFC9F9FC),
        border: const Border(
          bottom: BorderSide(
            width: 7,
            color: Color(0xFF000000),
          ),
          left: BorderSide(
            width: 7,
            color: Color(0xFF000000),
          ),
          right: BorderSide(
            width: 2,
            color: Color(0xFF000000),
          ),
          top: BorderSide(
            width: 2,
            color: Color(0xFF000000),
          ),
        ),
      ),
      child: !widget.isFlashing
          ? widget.isTapped != ''
              ? widget.isFadingIcon
                  ? Center(
                      child: SvgPicture.asset(
                        'assets/icons/${widget.isTapped == 'x' ? 'x' : 'o'}_op.svg',
                        height: 80,
                        width: 80,
                      ),
                    )
                  : Center(
                      child: SvgPicture.asset(
                        'assets/icons/${widget.isTapped == 'x' ? 'x' : 'o'}.svg',
                        height: 80,
                        width: 80,
                      ),
                    )
              : null
          : Center(
              child: SvgPicture.asset(
                'assets/icons/${widget.isTapped == 'x' ? 'x' : 'o'}_op.svg',
                height: 80,
                width: 80,
              ),
            ),
    );
  }
}
