import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'controllers/todosub_controller.dart';
import 'functions.dart';

class AddSubTaskModal extends StatefulWidget {
  AddSubTaskModal({Key? key}) : super(key: key);

  @override
  State<AddSubTaskModal> createState() => _AddSubTaskModalState();
}

class _AddSubTaskModalState extends State<AddSubTaskModal> {
  final TodoSubController todoSubController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: const SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Icon(Icons.close_outlined),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Task Deadline',
              style: GoogleFonts.poppins(color: Colors.grey.shade400),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: 30,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    todoSubController.subitem.value.createdDate ??
                        "Select task deadline",
                    style: GoogleFonts.poppins(),
                  ),
                  InkWell(
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2022),
                                lastDate: DateTime(2030))
                            .then((date) {
                          setState(() {
                            todoSubController.subitem.value.createdDate =
                                dateFormatter(date!);
                          });
                        });
                      },
                      child: SvgPicture.asset('assets/calendar.svg'))
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              'Sub Task Title',
              style: GoogleFonts.poppins(color: Colors.grey.shade400),
            ),
            Center(
              child: TextField(
                onChanged: (value) => setState(() {
                  todoSubController.subitem.value.title = value;
                }),
                maxLines: 2,
                decoration: InputDecoration(
                  hintText: 'Enter sub task title',
                  hintStyle: GoogleFonts.poppins(color: Colors.grey.shade300),
                  border: InputBorder.none,
                ),
              ),
            ),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
            Align(
                alignment: Alignment.centerRight,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.grey.shade900,
                      side: BorderSide(color: Colors.grey.shade900, width: 1),
                    ),
                    onPressed: () {
                      FocusScope.of(context).unfocus();
                      Navigator.pop(context, todoSubController.subitem);
                    },
                    child: Text(
                      'Add Sub Task',
                      style: GoogleFonts.poppins(color: Colors.white),
                    )))
          ],
        ),
      ),
    );
  }
}
