import 'package:flutter/material.dart';
import 'package:flutter_todo_app/controllers/todo_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'hero_widget.dart';
import 'models/todo.dart';

class TodoPage extends StatefulWidget {
  int index;
  int currentPage;
  TodoPage({Key? key, required this.index, required this.currentPage})
      : super(key: key);

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> with TickerProviderStateMixin {
  late AnimationController sizeController;
  final TodoController todoController = Get.find();
  var _visible = false;
  late Todo changedTodo;

  @override
  void initState() {
    // TODO: implement initState
    sizeController = AnimationController(
        vsync: this,
        lowerBound: 60.0,
        upperBound: Get.width - 92.0,
        duration: const Duration(milliseconds: 700));
    sizeController.addListener(() {
      setState(() {});
    });
    sizeController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _visible = true;
        });
      }
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
            Row(
              children: [
                const SizedBox(
                  width: 60,
                ),
                HeroWidget(
                  tag: todoController
                          .todoItems[widget.index].todoHeroTag.titleHeroTag +
                      widget.index.toString(),
                  child: Text(
                    todoController.todoItems[widget.index].title,
                    style: GoogleFonts.poppins(
                        color: Colors.black,
                        fontSize: 36,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
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
                  itemCount: todoController
                      .todoItems[widget.index].todoSubItem!.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.only(left: 60.0),
                      color: todoController.todoItems[widget.index]
                                  .todoSubItem![index].todoType ==
                              TodoType.isCompleted
                          ? const Color(0xffF3F3F7)
                          : Colors.transparent,
                      height: 72,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            HeroWidget(
                              tag: todoController.todoItems[widget.index]
                                      .todoHeroTag.itemHeroTag +
                                  "_" +
                                  widget.index.toString() +
                                  "_" +
                                  index.toString(),
                              child: todoController.todoItems[widget.index]
                                          .todoSubItem![index].todoType ==
                                      TodoType.isCompleted
                                  ? Text(
                                      "        " +
                                          todoController.todoItems[widget.index]
                                              .todoSubItem![index].title!,
                                      style: GoogleFonts.poppins(
                                          height: 1.8,
                                          color: const Color(0xffEF4636),
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          decorationThickness: 1.4,
                                          decoration:
                                              TextDecoration.lineThrough))
                                  : Row(
                                      children: [
                                        SizedBox(
                                          width: 18,
                                          height: 18,
                                          child: Checkbox(
                                            value: false,
                                            onChanged: (value) => setState(() {
                                              todoController
                                                      .todoItems[widget.index]
                                                      .todoSubItem![index]
                                                      .todoType =
                                                  TodoType.isCompleted;
                                            }),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4)),
                                            side: const BorderSide(
                                              color: Colors.black45,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 12,
                                        ),
                                        Text(
                                            todoController
                                                .todoItems[widget.index]
                                                .todoSubItem![index]
                                                .title!,
                                            style: GoogleFonts.poppins(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 14,
                                            ))
                                      ],
                                    ),
                            ),
                            AnimatedOpacity(
                              opacity: _visible ? 1.0 : 0.0,
                              child: Padding(
                                padding: EdgeInsets.only(top: 8.0),
                                child: Text(
                                  todoController.todoItems[widget.index]
                                      .todoSubItem![index].createdDate!,
                                  style:
                                      GoogleFonts.poppins(color: Colors.grey),
                                ),
                              ),
                              duration: const Duration(milliseconds: 700),
                            )
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
