import 'package:flutter/material.dart';
import 'package:refactory_test/containers/course/index.dart';
import 'package:refactory_test/containers/list_course/index.dart';
import 'containers/login.dart';
import 'containers/home/index.dart';
import 'containers/register.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Refactory App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        accentColor: Colors.white,
        primaryColor: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        buttonTheme: ButtonThemeData(
          buttonColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(),
          textTheme: ButtonTextTheme.accent,
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1.0),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.red, width: 1.0),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey, width: 1.0),
          ),
        ),
      ),
      routes: {
        '/': (context) => Login(),
        '/home': (context) => Home(),
        '/register': (context) => Register(),
        '/course': (context) => Course(),
        '/listcourse': (context) => ListCourse()
      },
    );
  }
}
