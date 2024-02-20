import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sunlight/pages/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  runApp(
    MaterialApp(
      home: const Home(),
      theme: ThemeData(useMaterial3: false),
      debugShowCheckedModeBanner: false,
    ),
  );
}
