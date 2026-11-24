import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:taskflow/app/taskflow_app.dart';
import 'package:taskflow/features/tasks/data/local_task_repository.dart';
import 'package:taskflow/features/tasks/data/task_repository.dart';
import 'package:taskflow/features/tasks/presentation/tasks_view_model.dart';

void main() {
  testWidgets('muestra la lista de tareas', (WidgetTester tester) async {
    final TaskRepository repository = LocalTaskRepository();
    final viewModel = TasksViewModel(repository);
    await viewModel.loadTasks();

    await tester.pumpWidget(
      ChangeNotifierProvider<TasksViewModel>(
        create: (_) => viewModel,
        child: const TaskFlowApp(),
      ),
    );

    expect(find.text('Mis tareas'), findsOneWidget);
    expect(find.text('Revisar apuntes de Flutter'), findsOneWidget);
  });
}