import 'package:flutter/material.dart';
import 'package:flutter_app_1/routes/app_route.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoute _appRoute = AppRoute();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      onGenerateRoute: _appRoute.onGenerateRoute,
    );
  }

  @override
  void dispose() {
    _appRoute.dispose();
    super.dispose();
  }
}
