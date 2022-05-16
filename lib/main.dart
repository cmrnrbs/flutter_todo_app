import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
              Container(
                width: 56,
                height: 56,
                child: Center(
                  child: Icon(Icons.add),
                ),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.black12),
                    borderRadius: BorderRadius.circular(6)),
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
