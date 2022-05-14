import 'package:flutter/material.dart';
import 'models/todo.dart';

import 'hero_widget.dart';
import 'todo_detail.dart';

class TodoWidget extends StatefulWidget {
  final int itemIndex;
  final Color itemColor;
  final List<Todo> todos;
  const TodoWidget(
      {Key? key,
      required this.itemIndex,
      required this.itemColor,
      required this.todos})
      : super(key: key);

  @override
  State<TodoWidget> createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () {
            print(widget.itemIndex);

            Navigator.push(
                context,
                PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 700),
                    pageBuilder: (_, __, ___) => TodoDetail(
                          heroTag: widget.todos[widget.itemIndex].todoHeroTag
                                  .containerHeroTag +
                              widget.itemIndex.toString(),
                          todo: widget.todos[widget.itemIndex],
                          currentPageIndex: widget.itemIndex,
                          todoInfo: widget.todos,
                        )));
          },
          child: SizedBox(
              width: 160,
              child: Stack(
                children: [
                  HeroWidget(
                    tag: widget.todos[widget.itemIndex].todoHeroTag
                            .containerHeroTag +
                        widget.itemIndex.toString(),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: widget.itemColor,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 0, 40),
                    child: Column(
                      children: [
                        HeroWidget(
                          tag: widget.todos[widget.itemIndex].todoHeroTag
                                  .titleHeroTag +
                              widget.itemIndex.toString(),
                          child: Row(
                            children: [
                              Text(
                                widget.todos[widget.itemIndex].title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Divider(
                          height: 1,
                          color: Colors.white,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        HeroWidget(
                          tag: "deneme" + widget.itemIndex.toString(),
                          child: widget.todos[widget.itemIndex].todoSubItem![0]
                                      .todoType ==
                                  TodoType.isCompleted
                              ? Text(
                                  widget.todos[widget.itemIndex].todoSubItem![0]
                                      .title!,
                                  style: new TextStyle(
                                      decoration: TextDecoration.lineThrough))
                              : Row(
                                  children: [
                                    Checkbox(
                                      value: false,
                                      onChanged: (value) => print(value),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(4)),
                                      side: BorderSide(
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      'Deneme',
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                      ),
                                    )
                                  ],
                                ),
                        )
                      ],
                    ),
                  ),
                ],
              )),
        ),
        const SizedBox(
          width: 10,
        )
      ],
    );
  }
}
