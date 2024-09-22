// TO-DO Repository

// In this we will define what the app can do

// abstract = base class
import 'package:todo_app/domain/models/todo.dart';

abstract class TodoRepo {
  // get the list of todos
  Future<List<Todo>> getTodos();

  // add new tood
  Future<void> addTodo(Todo todo);

  // update an existing todo
  Future<void> updateTodo(Todo todo);

  // delte a toodo
  Future<void> deleteTodo(Todo todo);
}

/* 
- Notes:
The repo in the domain layer outlines what operations the app can do, but doesn't worry about the specific implementation details. That's for the data layer

- Technology Agnostic: 
Independent of any technology or framework (purely a dart file, and has nothign to do with flutter or bloc or anything else) no matter what technology we use, this is what I want my todo app to perform.

 */