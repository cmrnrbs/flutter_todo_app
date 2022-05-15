import 'package:flutter/material.dart';
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

    for (var i = 0; i < 3; i++) {
      Color itemColor = i == 0
          ? Colors.blue.shade900
          : (i == 1)
              ? Colors.red.shade900
              : Colors.yellow.shade900;

      todoItems.add(Todo(
          title: 'Title' + i.toString(),
          itemColor: itemColor,
          todoHeroTag: TodoHeroTag(
              containerHeroTag: 'test',
              titleHeroTag: 'title',
              itemHeroTag: 'item'),
          todoSubItem: [
            TodoSubItem(todoType: TodoType.isCompleted, title: 'Book flights'),
            TodoSubItem(
                todoType: TodoType.isCompleted, title: 'Passport check'),
            TodoSubItem(todoType: TodoType.isReady, title: 'Packing luggaasd'),
            TodoSubItem(todoType: TodoType.isReady, title: 'Hotel reservation'),
          ]));
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const ExtrementalNavigationBar(),
      body: Column(
        children: [
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
                  text: const TextSpan(
                      text: 'Tasks',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          fontWeight: FontWeight.bold),
                      children: <TextSpan>[
                        TextSpan(
                          text: ' Lists',
                          style: TextStyle(
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
              const Text(
                'Add List',
                style: TextStyle(color: Colors.black54, fontSize: 14),
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
