// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
// import 'package:flutter_application_1/pages/login.dart';
// import 'package:flutter_application_1/pages/register.dart';
import 'package:flutter_application_1/route_generator.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
