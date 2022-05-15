import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'gradient_divider.dart';

class ExtrementalNavigationBar extends StatelessWidget {
  const ExtrementalNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: Row(
        children: [
          Expanded(
              child: SizedBox(
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
              child: Container(
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
              child: Container(
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
