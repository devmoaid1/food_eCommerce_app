import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:flutter_svg/svg.dart';
import 'package:flutter_task_app/core/theme/colors.dart';

class NavIcon extends StatelessWidget {
  final String iconPath;
  final int itemIndex;
  final int activeIndex;
  const NavIcon(
      {Key? key,
      required this.iconPath,
      required this.itemIndex,
      required this.activeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SvgPicture.asset(
        semanticsLabel: "icon",
        iconPath,
        height: 25,
        color: itemIndex == activeIndex
            ? Theme.of(context).primaryColor
            : AppColors.disabledColor,
      ),
    );
  }
}
