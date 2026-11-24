import '../domain/task.dart';
import 'task_repository.dart';

class LocalTaskRepository implements TaskRepository {
  final List<Task> _tasks = [
    const Task(
      id: 1,
      title: 'Revisar apuntes de Flutter',
      description: 'Repasar widgets, state y navegación antes de la práctica.',
      priority: 'Alta',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 2,
      title: 'Preparar exposición',
      description: 'Organizar diapositivas y practicar la explicación final.',
      priority: 'Alta',
      isCompleted: true,
      userId: 1,
    ),
    const Task(
      id: 3,
      title: 'Organizar tareas del proyecto',
      description: 'Separar pendientes por prioridad y fecha límite.',
      priority: 'Media',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 4,
      title: 'Leer materiales del curso',
      description: 'Completar la lectura de la sesión 5 y resumir conceptos.',
      priority: 'Baja',
      isCompleted: false,
      userId: 1,
    ),
    const Task(
      id: 5,
      title: 'Subir evidencia al repositorio',
      description: 'Registrar el avance y comprobar la estructura de TaskFlow.',
      priority: 'Media',
      isCompleted: false,
      userId: 1,
    ),
  ];

  @override
  List<Task> getTasks() => List.unmodifiable(_tasks);

  @override
  void save(Task task) {
    final index = _tasks.indexWhere((item) => item.id == task.id);
    if (index == -1) return;
    _tasks[index] = task;
  }
}