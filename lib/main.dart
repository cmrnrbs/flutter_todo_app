import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'controllers/todo_controller.dart';
import 'controllers/todosub_controller.dart';
import 'models/color_selection.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'add_subtask_modal.dart';
import 'extramental_navigation_bar.dart';

import 'models/todo.dart';
import 'todo_sub_chip.dart';
import 'todo_widget.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Todo App",
    home: HomeScreen(),
  ));
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TodoController todoController = Get.put(TodoController());
  TodoSubController _ =  Get.put(TodoSubController());
  List<ColorSelection> colorSelections = [
    ColorSelection(currentColor: Colors.green.shade900, isSelected: false),
    ColorSelection(currentColor: Colors.blue.shade900, isSelected: false),
    ColorSelection(currentColor: Colors.red.shade900, isSelected: false),
    ColorSelection(currentColor: Colors.yellow.shade900, isSelected: false),
  ];

  @override
  void initState() {
    // TODO: implement initState
    todoController.init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ExtrementalNavigationBar(),
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Column(
        children: [
          const SizedBox(
            height: 54,
          ),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 60.0),
              child: SvgPicture.asset(
                'assets/document.svg',
                width: 30,
              ),
            ),
          ),
          const Spacer(),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              const Expanded(
                child: Divider(
                  height: 1,
                  thickness: 0.4,
                  color: Colors.black,
                  endIndent: 20,
                ),
              ),
              Expanded(
                  child: Center(
                child: RichText(
                  text: TextSpan(
                      text: 'Tasks',
                      style: GoogleFonts.poppins(
                          color: Colors.black,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Lists',
                          style: GoogleFonts.poppins(
                              color: Colors.black38,
                              fontSize: 23,
                              fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
              )),
              const Expanded(
                child: Divider(
                  height: 1,
                  thickness: 0.4,
                  color: Colors.black,
                  indent: 20,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 60,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InkWell(
                onTap: () => showModalBottomSheet(
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return AddTaskModal(
                        colorSelections: colorSelections,
                      );
                    }).whenComplete(() {
                  int index = colorSelections
                      .indexWhere((element) => element.isSelected == true);
                  if (index != -1) {
                    setState(() {
                      colorSelections[index].isSelected = false;
                    });
                  }
                }),
                child: Container(
                  width: 56,
                  height: 56,
                  child: Center(
                    child: Icon(Icons.add),
                  ),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.black12),
                      borderRadius: BorderRadius.circular(6)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Add List',
                style: GoogleFonts.poppins(color: Colors.black54, fontSize: 14),
              )
            ],
          ),
          const Spacer(),
          SizedBox(
            height: 260,
            child: ListView.builder(
              padding: const EdgeInsets.only(left: 10),
              itemBuilder: (context, index) {
                return TodoWidget(
                  itemIndex: index,
                  itemColor: todoController.todoItems[index].itemColor,
                  todos: List<Todo>.from(todoController.todoItems.value),
                );
              },
              itemCount: todoController.todoItems.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}

class AddTaskModal extends StatefulWidget {
  List<ColorSelection> colorSelections;
  AddTaskModal({Key? key, required this.colorSelections}) : super(key: key);

  @override
  State<AddTaskModal> createState() => _AddTaskModalState();
}

class _AddTaskModalState extends State<AddTaskModal> {
  final TodoController todoController = Get.find();
  final TodoSubController todoSubController = Get.find();
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
          color: Colors.white),
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            Align(
              alignment: Alignment.topRight,
              child: InkWell(
                onTap: () => Navigator.pop(context),
                child: SizedBox(
                  width: 50,
                  height: 50,
                  child: Center(
                    child: Icon(Icons.close_outlined),
                  ),
                ),
              ),
            ),
            Text(
              'Task Color',
              style: GoogleFonts.poppins(color: Colors.grey.shade400),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
                height: 36,
                child: ListView.builder(
                  itemCount: widget.colorSelections.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () => setState(() {
                        if (selectedIndex != -1) {
                          widget.colorSelections[selectedIndex].isSelected =
                              false;
                        }
                        widget.colorSelections[index].isSelected = true;
                        selectedIndex = index;
                      }),
                      child: Container(
                        width: 36,
                        height: 36,
                        child: Center(
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color:
                                    widget.colorSelections[index].currentColor),
                          ),
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: widget.colorSelections[index].isSelected
                              ? Border.all(
                                  width: 2, color: Colors.grey.shade400)
                              : null,
                        ),
                      ),
                    );
                  },
                )),
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
              'Task Title',
              style: GoogleFonts.poppins(color: Colors.grey.shade400),
            ),
            const SizedBox(
              height: 30,
              child: Center(
                child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                  ),
                ),
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
              'Sub Tasks',
              style: GoogleFonts.poppins(color: Colors.grey.shade400),
            ),
            todoSubController.todosubitems.isNotEmpty
                ? Wrap(spacing: 10,children: todoSubController.todosubitems.map((i) => TodoSubChip(
                              selectedIndex: selectedIndex,
                              todoSubItem: i,
                              colorSelections: widget.colorSelections)).toList(),)
                : const SizedBox(),
            Obx(() => Text("${todoSubController.todosubitems.length}")),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
                onPressed: () async{
                  var data = await showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => AddSubTaskModal());
                    if(data != null)
                    {
                      todoSubController.addSubItem(data);
                    }
                },
                child: Text(
                  'Add Sub Task',
                  style: GoogleFonts.poppins(color: Colors.grey.shade400),
                )),
            const Spacer(),
            Center(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade400, width: 1),
                    ),
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      'Add Task',
                      style: GoogleFonts.poppins(color: Colors.grey.shade400),
                    )))
          ],
        ),
      ),
    );
  }
}