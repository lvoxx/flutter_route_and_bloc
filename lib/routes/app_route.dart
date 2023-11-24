import 'package:flutter/material.dart';
import 'package:flutter_app_1/logic/bloc/counter_bloc.dart';
import 'package:flutter_app_1/pages/home_page.dart';
import 'package:flutter_app_1/pages/second_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRoute {
  final CounterBloc _counterBloc = CounterBloc();
  Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: const HomePage(),
          ),
        );
      case '/second':
        return MaterialPageRoute(
          builder: (_) => BlocProvider.value(
            value: _counterBloc,
            child: const SecondPage(),
          ),
        );
      default:
        return null;
    }
  }

  void dispose() {
    _counterBloc.close();
  }
}
