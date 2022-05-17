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
  VoidCallback onPressChip;
  TodoSubChip(
      {Key? key,
      required this.colorSelections,
      this.selectedIndex = -1,
      required this.todoSubItem,
      required this.onPressChip})
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
        widget.onPressChip();
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
                Padding(
                  padding: const EdgeInsets.only(left: 4.0),
                  child: Text(
                    widget.todoSubItem.title!,
                    style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: widget.selectedIndex != -1
                            ? Colors.white
                            : Colors.black),
                  ),
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
                      size: 14,
                    ),
                  ),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: widget.selectedIndex != -1
                        ? Colors.black26
                        : Colors.grey.shade400,
                  ),
                )
              ],
            ),
          )),
    );
  }
}
