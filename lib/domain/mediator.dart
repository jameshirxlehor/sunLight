import 'package:sqflite/sqflite.dart';

class Mediator {
  Mediator._privateConstructor();

  static final Mediator _instance = Mediator._privateConstructor();

  factory Mediator() {
    return _instance;
  }

  late Database db;
}