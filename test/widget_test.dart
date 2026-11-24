import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/main.dart';

void main() {
  testWidgets('Comprueba cambios en el contador de tareas', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('Tareas pendientes: 3'), findsOneWidget);
    expect(find.text('Completadas hoy: 0 de 5'), findsOneWidget);

    await tester.tap(find.text('Completar una tarea'));
    await tester.pump();

    expect(find.text('Tareas pendientes: 2'), findsOneWidget);
    expect(find.text('Completadas hoy: 1 de 5'), findsOneWidget);
  });
}