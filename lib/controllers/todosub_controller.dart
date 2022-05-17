import '../models/todo.dart';
import 'package:get/get.dart';

class TodoSubController extends GetxController {
  var todosubitems = [].obs;
  var subitem = TodoSubItem(todoType: TodoType.isReady, createdDate: null).obs;

  addSubItem(Rx<TodoSubItem> item){
   todosubitems.add(item.value);
  }
  
}