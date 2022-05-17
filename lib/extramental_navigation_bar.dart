import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'gradient_divider.dart';

class ExtrementalNavigationBar extends StatefulWidget {
  const ExtrementalNavigationBar({Key? key}) : super(key: key);

  @override
  State<ExtrementalNavigationBar> createState() =>
      _ExtrementalNavigationBarState();
}

class _ExtrementalNavigationBarState extends State<ExtrementalNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          Expanded(
              child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: selectedIndex == 0 ? Colors.grey.shade100 : Colors.white,
            child: Center(
              child: SvgPicture.asset(
                'assets/home.svg',
                color: Colors.black54,
              ),
            ),
            width: 100,
          )),
          GradientDivider(
              isHorizontal: true,
              size: 100,
              thickness: 0.4,
              start: 0,
              end: 100,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.black.withAlpha(0)],
              ),
              color: Colors.black),
          Expanded(
              child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: selectedIndex == 1 ? Colors.grey.shade100 : Colors.white,
            width: 100,
            child: Center(
              child: SvgPicture.asset(
                'assets/calendar.svg',
                color: Colors.black54,
              ),
            ),
          )),
          GradientDivider(
              isHorizontal: true,
              size: 100,
              thickness: 0.4,
              start: 0,
              end: 100,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Colors.black, Colors.black.withAlpha(0)],
              ),
              color: Colors.black),
          Expanded(
              child: AnimatedContainer(
            duration: const Duration(milliseconds: 400),
            color: selectedIndex == 2 ? Colors.grey.shade100 : Colors.white,
            width: 100,
            child: Center(
              child: SvgPicture.asset(
                'assets/category.svg',
                color: Colors.black54,
              ),
            ),
          ))
        ],
      ),
      decoration: BoxDecoration(
          border: Border(top: BorderSide(color: Colors.black, width: 0.4))),
    );
  }
}
