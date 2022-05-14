import 'package:flutter/material.dart';

enum TodoType { isCompleted, isReady }

class Todo {
  String title;
  Color itemColor;
  TodoHeroTag todoHeroTag;
  List<TodoSubItem>? todoSubItem;
  Todo(
      {required this.title,
      required this.itemColor,
      required this.todoHeroTag,
      this.todoSubItem = const []});
}

class TodoSubItem {
  TodoType todoType;
  String? title;
  TodoSubItem({required this.todoType, this.title});
}

class TodoHeroTag {
  String containerHeroTag;
  String titleHeroTag;
  String itemHeroTag;
  TodoHeroTag({required this.containerHeroTag,required this.titleHeroTag, required this.itemHeroTag});
}
