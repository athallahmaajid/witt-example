import 'package:flutter/material.dart';
import 'package:witt/witt.dart';
import 'counter_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WServiceBuilder(
        serviceBuilder: (context) {
          WService.addSingleton(() => CounterController());
        },
        child: const MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = WService.get<CounterController>();
    return Scaffold(
      body: Center(
        child: WListener(
          notifier: c.counter,
          builder: (context) {
            return Text(c.counter.value.toString());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: c.incrementCounter,
        child: const Icon(Icons.add),
      ),
    );
  }
}
