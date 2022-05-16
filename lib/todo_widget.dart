import 'dart:developer';

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
                        //TODO: item_0_0 item_0_1 şeklinde çoçukları sıralıcaz
                        Expanded(
                            child: ListView.builder(
                          itemBuilder: (context, index) {
                            var todoItem = widget.todos[widget.itemIndex];
                            return HeroWidget(
                              tag: todoItem.todoHeroTag.itemHeroTag +
                                  "_" +
                                  widget.itemIndex.toString() +
                                  "_" +
                                  index.toString(),
                              child: todoItem.todoSubItem![index].todoType ==
                                      TodoType.isCompleted
                                  ? Text(todoItem.todoSubItem![index].title!,
                                      style: const TextStyle(
                                          color: Colors.white38,
                                          fontSize: 13,
                                          height: 1.8,
                                          decoration:
                                              TextDecoration.lineThrough))
                                  : Row(
                                      children: [
                                        SizedBox(
                                          width: 18,
                                          height: 24,
                                          child: Transform.scale(
                                            scale: 0.7,
                                            child: Checkbox(
                                              materialTapTargetSize:
                                                  MaterialTapTargetSize
                                                      .shrinkWrap,
                                              value: false,
                                              onChanged: (value) => null,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(4)),
                                              side: const BorderSide(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        SizedBox(
                                          width: 116,
                                          child: Text(
                                            todoItem.todoSubItem != null
                                                ? todoItem
                                                    .todoSubItem![index].title!
                                                : "",
                                            style: const TextStyle(
                                                color: Colors.white,
                                                fontSize: 13,
                                                overflow:
                                                    TextOverflow.ellipsis),
                                          ),
                                        )
                                      ],
                                    ),
                            );
                          },
                          itemCount: widget.todos[widget.itemIndex].todoSubItem!
                                      .length >
                                  4
                              ? 4
                              : widget
                                  .todos[widget.itemIndex].todoSubItem!.length,
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          padding: const EdgeInsets.all(0),
                        ))
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
