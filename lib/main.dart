import 'package:bloc_project/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (_) => ColorBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BLoC State Management'),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () {
              context.read<ColorBloc>().add(ColorToAmber());
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(
            width: 10,
          ),
          FloatingActionButton(
            onPressed: () {
              context.read<ColorBloc>().add(ColorToLightBlue());
            },
            backgroundColor: Colors.lightBlue,
          )
        ],
      ),
      body: Center(child: BlocBuilder<ColorBloc, Color>(
        builder: (_, currentcolor) {
          return AnimatedContainer(
            width: 100,
            height: 100,
            color: currentcolor,
            duration: Duration(milliseconds: 500),
          );
        },
      )),
    );
  }
}
