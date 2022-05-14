import 'package:flutter/material.dart';

import 'hero_widget.dart';
import 'models/todo.dart';

class TodoPage extends StatefulWidget {
  int index;
  int currentPage;
  Todo todo;
  TodoPage(
      {Key? key,
      required this.index,
      required this.currentPage,
      required this.todo})
      : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> with TickerProviderStateMixin {
  late AnimationController sizeController;

  @override
  void initState() {
    // TODO: implement initState

    sizeController = AnimationController(
        vsync: this,
        lowerBound: 40.0,
        upperBound: 400.0,
        duration: const Duration(milliseconds: 700));
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
    if (widget.index == 0) {
      sizeController.forward();
    }
    return Stack(
      children: [
        Column(
          children: [
            HeroWidget(
              tag: widget.todo.todoHeroTag.titleHeroTag +
                  widget.index.toString(),
              child: Row(
                children: [
                  Text(
                    widget.todo.title,
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              thickness: 2,
              indent: 400 - sizeController.value,
            ),
            SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}
