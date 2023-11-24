import 'package:flutter/material.dart';
import 'package:flutter_app_1/logic/bloc/counter_bloc.dart';
import 'package:flutter_app_1/logic/bloc/counter_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
        centerTitle: true,
      ),
      body: BlocBuilder<CounterBloc, int>(builder: (context, count) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              (count > 0)
                  ? Text('You have pressed $count times')
                  : const Text('Press Add button to start counting'),
              const SizedBox(height: 10.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //Minus
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      color: Colors.red[600],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      onPressed: () => BlocProvider.of<CounterBloc>(context)
                          .add(CounterDecrementPressed()),
                      icon: const Icon(Icons.minimize),
                    ),
                  ),
                  //Reset
                  Container(
                      padding: const EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 2.0),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(12.0)),
                        color: Colors.blue[600],
                      ),
                      child: TextButton(
                        onPressed: () => BlocProvider.of<CounterBloc>(context)
                            .add(CounterResetPressed()),
                        child: const Text(
                          'Reset',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      )),
                  //Add
                  Container(
                    decoration: BoxDecoration(
                      borderRadius:
                          const BorderRadius.all(Radius.circular(12.0)),
                      color: Colors.green[400],
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      color: Colors.white,
                      onPressed: () => BlocProvider.of<CounterBloc>(context)
                          .add(CounterIncrementPressed()),
                      icon: const Icon(Icons.add),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              (count < 0)
                  ? Text('Count must be greater than 0. Now is $count')
                  : const SizedBox(height: 0),
            ],
          ),
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed('/second');
        },
        child: const Icon(Icons.east),
      ),
    );
  }
}
