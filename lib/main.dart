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
            TodoSubItem(todoType: TodoType.isCompleted, title: 'Deneme'),
            TodoSubItem(todoType: TodoType.isCompleted, title: 'Deneme'),
            TodoSubItem(todoType: TodoType.isReady, title: 'Deneme'),
            TodoSubItem(todoType: TodoType.isReady, title: 'Deneme'),
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
