import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'car.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String inputText = '';
  var controller = TextEditingController();
  var box = Hive.box('names');
  var carBox = Hive.box<Car>('carBox');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(controller: controller),
            Text(box.get(2) ?? 'empty', style: const TextStyle(fontSize: 30)),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 26),
              ),
              onPressed: () {
                box.put(2, controller.text);
                setState(() {});
              },
              child: Text('read from textfiled'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 26),
              ),
              onPressed: () {
                box.put(1, 'amir');
              },
              child: Text('create'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 26),
              ),
              onPressed: () {
                var text = box.get(1);
                print(text);
              },
              child: Text('read'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 26),
              ),
              onPressed: () {
                box.put(1, 'Ariana');
              },
              child: Text('update'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                textStyle: const TextStyle(fontSize: 26),
              ),
              onPressed: () {
                box.delete(1);
              },
              child: Text('delete'),
            ),
          ],
        ),
      ),
    );
  }
}
