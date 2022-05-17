import 'dart:convert';
import 'dart:developer';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_todo_app/models/color_selection.dart';
import 'package:google_fonts/google_fonts.dart';
import 'extramental_navigation_bar.dart';

import 'models/todo.dart';
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
  List<Todo> todoItems = [];
  List<ColorSelection> colorSelections = [
    ColorSelection(currentColor: Colors.green.shade900, isSelected: false),
    ColorSelection(currentColor: Colors.blue.shade900, isSelected: false),
    ColorSelection(currentColor: Colors.red.shade900, isSelected: false),
    ColorSelection(currentColor: Colors.yellow.shade900, isSelected: false),
  ];

  @override
  void initState() {
    // TODO: implement initState

    todoItems.add(Todo(
        title: 'Trip to Paris',
        itemColor: Colors.blue.shade900,
        todoHeroTag: TodoHeroTag(
            containerHeroTag: 'todo',
            titleHeroTag: 'title',
            itemHeroTag: 'item'),
        todoSubItem: [
          TodoSubItem(
            todoType: TodoType.isCompleted,
            title: 'Book flights',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isCompleted,
            title: 'Passport check',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isReady,
            title: 'Packing luggaasd',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isReady,
            title: 'Hotel reservation',
            createdDate: "Mon, Apr 30",
          ),
        ]));

    todoItems.add(Todo(
        title: 'My Tasks',
        itemColor: Colors.yellow.shade900,
        todoHeroTag: TodoHeroTag(
            containerHeroTag: 'todo',
            titleHeroTag: 'title',
            itemHeroTag: 'item'),
        todoSubItem: [
          TodoSubItem(
            todoType: TodoType.isCompleted,
            title: 'Book flights',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isCompleted,
            title: 'Passport check',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isReady,
            title: 'Packing luggaasd',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isReady,
            title: 'Hotel reservation',
            createdDate: "Mon, Apr 30",
          ),
        ]));

    todoItems.add(Todo(
        title: 'On Monday',
        itemColor: Colors.red.shade900,
        todoHeroTag: TodoHeroTag(
            containerHeroTag: 'todo',
            titleHeroTag: 'title',
            itemHeroTag: 'item'),
        todoSubItem: [
          TodoSubItem(
            todoType: TodoType.isReady,
            title: 'Buy milk',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isReady,
            title: 'Plan weekend outing',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isCompleted,
            title: 'Publish Friday blog post',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isReady,
            title: 'Run 3 miles',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isCompleted,
            title: 'Wash clothes',
            createdDate: "Mon, Apr 30",
          ),
          TodoSubItem(
            todoType: TodoType.isReady,
            title: 'Update Database',
            createdDate: "Mon, Apr 30",
          ),
        ]));

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
                  thickness: 1,
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
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Lists',
                          style: GoogleFonts.poppins(
                              color: Colors.black38,
                              fontSize: 24,
                              fontWeight: FontWeight.normal),
                        )
                      ]),
                ),
              )),
              const Expanded(
                child: Divider(
                  height: 1,
                  thickness: 1,
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
                  itemColor: todoItems[index].itemColor,
                  todos: todoItems,
                );
              },
              itemCount: todoItems.length,
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
  int selectedIndex = -1;
  List<TodoSubItem> todoSubList = [];

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
            todoSubList.length != 0
                ? Wrap(
                    spacing: 10,
                    runSpacing: 0,
                    children: [
                      for (var item in todoSubList)
                        TodoSubChip(
                            selectedIndex: selectedIndex,
                            colorSelections: widget.colorSelections,
                            todoSubList: todoSubList,
                            todoSubItem: item),
                    ],
                  )
                : const SizedBox(),
            Text("${todoSubList.length}"),
            OutlinedButton(
                style: OutlinedButton.styleFrom(
                  primary: Colors.white,
                  backgroundColor: Colors.white,
                  side: BorderSide(color: Colors.grey.shade400, width: 1),
                ),
                onPressed: () => showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    backgroundColor: Colors.transparent,
                    builder: (context) => AddSubTaskModal(
                          todoSubList: todoSubList,
                        )),
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

String dateFormatter(DateTime date) {
  dynamic dayData =
      '{ "1" : "Mon", "2" : "Tue", "3" : "Wed", "4" : "Thur", "5" : "Fri", "6" : "Sat", "7" : "Sun" }';

  dynamic monthData =
      '{ "1" : "Jan", "2" : "Feb", "3" : "Mar", "4" : "Apr", "5" : "May", "6" : "June", "7" : "Jul", "8" : "Aug", "9" : "Sep", "10" : "Oct", "11" : "Nov", "12" : "Dec" }';

  return json.decode(dayData)['${date.weekday}'] +
      ", " +
      date.day.toString() +
      " " +
      json.decode(monthData)['${date.month}'] +
      " " +
      date.year.toString();
}

class TodoSubChip extends StatefulWidget {
  List<ColorSelection> colorSelections;
  int selectedIndex;
  List<TodoSubItem> todoSubList;
  TodoSubItem todoSubItem;
  TodoSubChip(
      {Key? key,
      required this.colorSelections,
      this.selectedIndex = -1,
      required this.todoSubList,
      required this.todoSubItem})
      : super(key: key);

  @override
  State<TodoSubChip> createState() => _TodoSubChipState();
}

class _TodoSubChipState extends State<TodoSubChip> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        print(widget.todoSubList.length);
        setState(() {
          widget.todoSubList.remove(widget.todoSubItem);
        });
        print(widget.todoSubList.length);
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

class AddSubTaskModal extends StatefulWidget {
  List<TodoSubItem> todoSubList;
  AddSubTaskModal({Key? key, required this.todoSubList}) : super(key: key);

  @override
  State<AddSubTaskModal> createState() => _AddSubTaskModalState();
}

class _AddSubTaskModalState extends State<AddSubTaskModal> {
  TodoSubItem todoSubItem =
      TodoSubItem(todoType: TodoType.isReady, createdDate: null);

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
                child: SizedBox(
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
                    todoSubItem.createdDate ?? "Select task deadline",
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
                            todoSubItem.createdDate = dateFormatter(date!);
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
            SizedBox(
              height: 30,
              child: Center(
                child: TextField(
                  onChanged: (value) => setState(() {
                    todoSubItem.title = value;
                  }),
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
            const Spacer(),
            Center(
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      primary: Colors.white,
                      backgroundColor: Colors.white,
                      side: BorderSide(color: Colors.grey.shade400, width: 1),
                    ),
                    onPressed: () {
                      setState(() {
                        widget.todoSubList.add(todoSubItem);
                      });
                      Navigator.pop(context);
                    },
                    child: Text(
                      'Add Sub Task',
                      style: GoogleFonts.poppins(color: Colors.grey.shade400),
                    )))
          ],
        ),
      ),
    );
  }
}
