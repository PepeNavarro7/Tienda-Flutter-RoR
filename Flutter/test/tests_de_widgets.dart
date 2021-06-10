// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:ds_p2/detalles.dart';
import 'package:ds_p2/productosApi.dart';
import 'package:ds_p2/tienda.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:ds_p2/main.dart';

void main() {

  testWidgets ( 'Testeamos la pagina principal donde el usuario hace LogIn' , ( WidgetTester tester ) async {
    await tester.pumpWidget( MyApp() );
    expect(find.text('Iniciar Sesion'),findsOneWidget);
    expect(find.text('Login'),findsWidgets);
    expect(find.text('Registrarse'),findsOneWidget);
  });

  testWidgets ( 'entramos en la seccion de registro de usuario' , ( WidgetTester tester ) async {
    await tester.pumpWidget(MyApp());
    var button = find.text("Registrarse");
    await tester.tap(button);
    await tester.pumpAndSettle();
    expect(find.text('Apellidos'),findsOneWidget);
  });

  testWidgets ( 'Probamos que hay se despliega el AppBar correctamente' , ( WidgetTester tester ) async {
    await tester.pumpWidget(MyApp());
    expect(find.byType(AppBar), findsOneWidget);

    expect(find.byType(MaterialButton), findsWidgets);
    expect (find.text("Login"), findsWidgets);
  });
}

