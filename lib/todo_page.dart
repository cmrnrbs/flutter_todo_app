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
        lowerBound: 80.0,
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
    // if (widget.index == 0) {
    sizeController.forward();
    //}
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
            const SizedBox(
              height: 20,
            ),
            Divider(
              height: 1,
              thickness: 1,
              indent: 400 - sizeController.value,
            ),
            Expanded(
              child: SizedBox(
                child: ListView.builder(
                  itemCount: widget.todo.todoSubItem!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      height: 72,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HeroWidget(
                              tag: widget.todo.todoHeroTag.itemHeroTag +
                                  "_" +
                                  widget.index.toString() +
                                  "_" +
                                  index.toString(),
                              child: widget.todo.todoSubItem![index].todoType ==
                                      TodoType.isCompleted
                                  ? Text(widget.todo.todoSubItem![index].title!,
                                      style: const TextStyle(
                                          height: 1.8,
                                          color: Colors.red,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          decoration:
                                              TextDecoration.lineThrough))
                                  : Row(
                                      children: [
                                        SizedBox(
                                          width: 18,
                                          child: Checkbox(
                                            value: false,
                                            onChanged: (value) => print(value),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            side: const BorderSide(
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                          widget
                                              .todo.todoSubItem![index].title!,
                                          style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                          ),
                                        )
                                      ],
                                    ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
