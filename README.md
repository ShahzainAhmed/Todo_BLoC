# Todo App on Flutter BLoC

<p align="center" width="30%">
    <img width="60%" src="https://github.com/user-attachments/assets/18601630-977e-47b0-a444-8a294ba715ad">
</p>

## DATA Layer (top layer): 
This layer is responsible for connecting our domain layout to a database or an API or something, if you decide to change the datasource, for example from local storage to firebase, you only will have to worry about updating this layer. 

### Files:
db_todo.dart 
db_todo_repo.dart

## DOMAIN Layer (top layer): 
This layer defines the core logic of the app. It contains the fundamental business rules and is independent of any specific framework or database. This means you can implement it in Flutter, React Native, or any other technology while keeping the core logic intact.

### Files:
todo.dart 
todo_repo.dart
