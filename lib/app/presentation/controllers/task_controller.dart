import 'package:mobx/mobx.dart';
import 'package:task_clean_arch/app/core/entities/task_entitie.dart';
import 'package:task_clean_arch/app/core/repositories/task_repository.dart';
import 'package:task_clean_arch/app/data/repositories/task_repository_impl.dart';
part 'task_controller.g.dart';

class TaskController = TaskControllerBase with _$TaskController;

abstract class TaskControllerBase with Store {
  final TaskRepository _repository = TaskRepositoryImpl();

  @observable
  ObservableList<TaskEntity> tasks = ObservableList<TaskEntity>();

  @action
  Future<void> fetchTasks() async {
    tasks = ObservableList.of(await _repository.getTasks());
  }

  @action
  Future<void> addTask(TaskEntity task) async {
    tasks.add(await _repository.addTask(task));
  }

  @action
  Future<void> removeTask(int id) async {
    await _repository.removeTask(id);
    tasks.removeWhere((task) => task.id == id);
  }
}
