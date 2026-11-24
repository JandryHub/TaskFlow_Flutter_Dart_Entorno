import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/main.dart';
import 'package:taskflow/task.dart';

void main() {
  test('Task.fromJson mapea los campos del modelo', () {
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

  testWidgets('Renderiza listado y abre detalle de tarea', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('Mis tareas'), findsOneWidget);
    expect(find.text('Leer documentación'), findsOneWidget);

    await tester.tap(find.text('Leer documentación'));
    await tester.pumpAndSettle();

    expect(find.text('Detalle de tarea'), findsOneWidget);
    expect(find.text('Prioridad: Alta'), findsOneWidget);
    expect(find.text('Usuario: 1'), findsOneWidget);
  });
}