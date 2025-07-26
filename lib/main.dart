import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:note/car.dart';

import 'home_screen.dart';

void main() async {
  await Hive.initFlutter();
  var box = await Hive.openBox('names');
  Hive.registerAdapter(CarAdapter());
  await Hive.openBox<Car>('carBox');
  runApp(const Application());
}

class Application extends StatelessWidget {
  const Application({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
