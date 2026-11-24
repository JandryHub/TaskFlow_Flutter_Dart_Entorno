import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/main.dart';

void main() {
  testWidgets('Renderiza listado de tareas con ListView.builder', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('Mis tareas'), findsOneWidget);
    expect(find.text('Leer documentación'), findsOneWidget);
  });
}