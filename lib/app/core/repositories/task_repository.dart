import 'package:task_clean_arch/app/core/entities/task_entitie.dart';

abstract class TaskRepository {
  Future<List<TaskEntity>> getTasks();
  Future<TaskEntity> addTask(TaskEntity task);
  Future<void> removeTask(int id);
}
