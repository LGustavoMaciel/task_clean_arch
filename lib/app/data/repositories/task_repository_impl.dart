import 'package:task_clean_arch/app/core/entities/task_entitie.dart';
import 'package:task_clean_arch/app/core/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  List<TaskEntity> tasks = [];
  @override
  Future<TaskEntity> addTask(TaskEntity task) async {
    tasks.add(task);
    return task;
  }

  @override
  Future<List<TaskEntity>> getTasks() async {
    return tasks;
  }

  @override
  Future<void> removeTask(int id) async {
    tasks.removeWhere((task) => task.id == id);
  }
}
