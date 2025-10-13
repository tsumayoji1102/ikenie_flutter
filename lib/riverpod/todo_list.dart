import 'package:ikenie_flutter/model/todo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'todo_list.g.dart';

// Todoリスト管理
@riverpod
class TodoList extends _$TodoList {
  @override
  List<Todo> build() {
    return [
      const Todo(id: '1', title: 'Riverpod 3.0を学ぶ'),
      const Todo(id: '2', title: 'Flutterアプリを作る'),
      const Todo(id: '3', title: 'コーヒーを飲む', completed: true),
    ];
  }

  void addTodo(String title) {
    final newTodo = Todo(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title,
    );
    state = [...state, newTodo];
  }

  void toggleTodo(String id) {
    state = [
      for (final todo in state)
        if (todo.id == id) todo.copyWith(completed: !todo.completed) else todo,
    ];
  }

  void removeTodo(String id) {
    state = state.where((todo) => todo.id != id).toList();
  }
}

// 完了していないTodoの数を計算
@riverpod
int uncompletedTodoCount(Ref ref) {
  final todos = ref.watch(todoListProvider);
  return todos.where((todo) => !todo.completed).length;
}
