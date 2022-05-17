import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/todo.dart';

class TodoController extends GetxController {
  var todoItems = [].obs;

  addSubItem(int index, Rx<TodoSubItem> subitem)
  {
    todoItems[index].todoSubItem!.add(subitem.value);
  }

  addTask(Rx<Todo> data){
    todoItems.add(data.value);
  }

  init(){
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
  }
}