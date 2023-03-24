// Flutter imports:
import 'package:coffee_beanventory/ui/component/coffee_dispenser.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coffee Beanventory',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const CoffeeDispenserScreen(),
    );
  }
}
