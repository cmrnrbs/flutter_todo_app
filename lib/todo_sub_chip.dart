import 'package:flutter/material.dart';
import 'package:flutter_todo_app/controllers/todosub_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/color_selection.dart';
import 'models/todo.dart';

class TodoSubChip extends StatefulWidget {
  List<ColorSelection> colorSelections;
  int selectedIndex;
  TodoSubItem todoSubItem;
  TodoSubChip(
      {Key? key,
      required this.colorSelections,
      this.selectedIndex = -1,
      required this.todoSubItem})
      : super(key: key);

  @override
  State<TodoSubChip> createState() => _TodoSubChipState();
}

class _TodoSubChipState extends State<TodoSubChip> {
  final TodoSubController todoSubController = Get.find();
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(todoSubController.todosubitems.length);
        todoSubController.todosubitems.remove(widget.todoSubItem);
        print(todoSubController.todosubitems.length);
      },
      child: Chip(
          backgroundColor: widget.selectedIndex != -1
              ? widget.colorSelections[widget.selectedIndex].currentColor
              : Colors.grey.shade200,
          padding: const EdgeInsets.all(0),
          labelPadding: const EdgeInsets.all(0),
          label: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.todoSubItem.title!,
                  style: GoogleFonts.poppins(fontSize: 12),
                ),
                const SizedBox(
                  width: 4,
                ),
                Container(
                  width: 24,
                  height: 24,
                  child: Center(
                    child: Icon(
                      Icons.close_outlined,
                      color: Colors.white,
                      size: 18,
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade400,
                  ),
                )
              ],
            ),
          )),
    );
  }
}

