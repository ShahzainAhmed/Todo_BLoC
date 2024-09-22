/* 
TODO CUBIT - simple state management

Each cubit is a list of todos
 */

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/domain/models/todo.dart';
import 'package:todo_app/domain/repository/todo_repo.dart';

class TodoCubit extends Cubit<List<Todo>> {
// reference todo repo
  final TodoRepo todoRepo;

// Constructor initializes the cubit wiht an empty list
  TodoCubit(this.todoRepo) : super([]) {
    loadTodos();
  }

  ////// LOAD TODOS  //////

  Future<void> loadTodos() async {
    // fetch list of todos from repo
    final todoList = await todoRepo.getTodos();

    // emit the fetched list as the new state
    emit(todoList);
  }

  ////// ADD TODOS    //////
  Future<void> addTodo(String text) async {
    // create a new todo with unique id
    final newTodo = Todo(
      id: DateTime.now().microsecondsSinceEpoch,
      text: text,
    );

    // save the new todo to repo
    await todoRepo.addTodo(newTodo);

    // reload
    loadTodos();
  }

  ////// DELETE TODOS //////
  Future<void> deleteTodo(Todo todo) async {
    // delete the provided todo from repo
    await todoRepo.deleteTodo(todo);

    // re-load
    loadTodos();
  }

  ////// TOGGLE TODOS //////
  Future<void> toggleCompletion(Todo todo) async {
    // toggle the completion status of provided todo
    final updatedTodo = todo.toggleCompletion();

    // update the todo in repo with new completion status
    await todoRepo.updateTodo(updatedTodo);

    // reload
    loadTodos();
  }
}
