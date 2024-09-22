/* 
ISAR TO DO MODEL

ISAR database

Converts todo model into isar todo model that we can store in our isar database.

Main takeaway here is less to do with ISAR database but more to do with the seperation of concerns, how we are seperating these folders from domain layer and data layer. 
 */

import 'package:isar/isar.dart';
import 'package:todo_app/domain/models/todo.dart';

// to generate isar todo object, run: dart run build_runner build
part 'isar_todo.g.dart';

@collection
class TodoIsar {
  Id id = Isar.autoIncrement;
  late String text;
  late bool isCompleted;

  // convert isar object => pure todo object to use in our app
  Todo toDomain() {
    return Todo(
      id: id,
      text: text,
      isCompleted: isCompleted,
    );
  }

  // convert pure todo object =>isar object to store in isar database
  static TodoIsar fromDomain(Todo todo) {
    return TodoIsar()
      ..id = todo.id
      ..text = todo.text
      ..isCompleted = todo.isCompleted;
  }
}
