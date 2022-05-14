import 'package:flutter/material.dart';

import 'hero_widget.dart';

// ignore: must_be_immutable
class IndicatorTodoWidget extends StatefulWidget {
  String tag;
  Color itemColor;
  int index;
  int currentPage;
  IndicatorTodoWidget(
      {Key? key,
      required this.tag,
      required this.itemColor,
      required this.index,
      required this.currentPage})
      : super(key: key);

  @override
  State<IndicatorTodoWidget> createState() => _IndicatorTodoWidgetState();
}

class _IndicatorTodoWidgetState extends State<IndicatorTodoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController sizeController;
  @override
  void initState() {
    // TODO: implement initState

    sizeController = AnimationController(
        vsync: this,
        lowerBound: 0.0,
        upperBound: 10.0,
        duration: const Duration(milliseconds: 400));
    sizeController.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    sizeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.index == widget.currentPage) {
      sizeController.forward();
    } else {
      sizeController.reverse();
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        HeroWidget(
            tag: widget.tag,
            child: Column(
              children: [
                SizedBox(
                  height: 10 - sizeController.value,
                ),
                Expanded(
                  child: Container(
                    width: 6,
                    decoration: BoxDecoration(
                        color: widget.itemColor,
                        borderRadius: BorderRadius.circular(2)),
                  ),
                ),
              ],
            )),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
