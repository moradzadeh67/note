import 'package:hive/hive.dart';

part 'car.g.dart';

@HiveType(typeId: 1)
class Car {
  Car({required this.name, required this.topSpeed, required this.price});

  @HiveField(0)
  String name;

  @HiveField(1)
  String topSpeed;

  @HiveField(2)
  String price;
}
