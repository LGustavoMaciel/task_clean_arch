// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskController on TaskControllerBase, Store {
  late final _$tasksAtom =
      Atom(name: 'TaskControllerBase.tasks', context: context);

  @override
  ObservableList<TaskEntity> get tasks {
    _$tasksAtom.reportRead();
    return super.tasks;
  }

  @override
  set tasks(ObservableList<TaskEntity> value) {
    _$tasksAtom.reportWrite(value, super.tasks, () {
      super.tasks = value;
    });
  }

  late final _$fetchTasksAsyncAction =
      AsyncAction('TaskControllerBase.fetchTasks', context: context);

  @override
  Future<void> fetchTasks() {
    return _$fetchTasksAsyncAction.run(() => super.fetchTasks());
  }

  late final _$addTaskAsyncAction =
      AsyncAction('TaskControllerBase.addTask', context: context);

  @override
  Future<void> addTask(TaskEntity task) {
    return _$addTaskAsyncAction.run(() => super.addTask(task));
  }

  late final _$removeTaskAsyncAction =
      AsyncAction('TaskControllerBase.removeTask', context: context);

  @override
  Future<void> removeTask(int id) {
    return _$removeTaskAsyncAction.run(() => super.removeTask(id));
  }

  @override
  String toString() {
    return '''
tasks: ${tasks}
    ''';
  }
}
