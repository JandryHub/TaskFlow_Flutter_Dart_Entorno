import 'package:flutter_test/flutter_test.dart';
import 'package:taskflow/main.dart';

void main() {
  testWidgets('Muestra la pantalla de bienvenida con información de TaskFlow', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const TaskFlowApp());

    expect(find.text('TaskFlow'), findsOneWidget);
    expect(find.text('¡Hola, Jandry Cedeño!'), findsOneWidget);
    expect(find.text('Tareas pendientes: 3'), findsOneWidget);
  });
}