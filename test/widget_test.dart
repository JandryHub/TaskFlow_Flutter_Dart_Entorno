import 'package:flutter_test/flutter_test.dart';

import 'package:taskflow/main.dart';
import 'package:taskflow/task.dart';

void main() {
  test('Task.fromJson maps all session 5 fields', () {
    final task = Task.fromJson({
      'id': 7,
      'title': 'Preparar exposición',
      'description': 'Organizar diapositivas y practicar',
      'priority': 'Alta',
      'isCompleted': false,
      'userId': 1,
    });

    expect(task.id, 7);
    expect(task.title, 'Preparar exposición');
    expect(task.description, 'Organizar diapositivas y practicar');
    expect(task.priority, 'Alta');
    expect(task.isCompleted, isFalse);
    expect(task.userId, 1);
  });

  testWidgets('List and detail show the selected task data', (
    WidgetTester tester,
  ) async {
    expect(demoTasks.map((task) => task.id).toSet(), hasLength(5));

    await tester.pumpWidget(const TaskFlowApp());
    expect(find.text('Mis tareas'), findsOneWidget);
    expect(find.text('Revisar apuntes de Flutter'), findsOneWidget);
    expect(find.text('Prioridad: Alta').last, findsOneWidget);

    await tester.tap(find.text('Revisar apuntes de Flutter'));
    await tester.pumpAndSettle();

    expect(find.text('Detalle de tarea'), findsOneWidget);
    expect(
      find.text('Repasar widgets y estado para la siguiente práctica.'),
      findsOneWidget,
    );
    expect(find.text('Prioridad: Alta'), findsOneWidget);
    expect(find.text('Estado: pendiente'), findsOneWidget);
    expect(find.text('Usuario: 1'), findsOneWidget);

    appRouter.pop();
    await tester.pumpAndSettle();
    expect(find.text('Mis tareas'), findsOneWidget);

    appRouter.go('/task/999');
    await tester.pumpAndSettle();
    expect(find.text('No se encontró esta tarea.'), findsOneWidget);
  });
}
