import 'package:check_your_cosmetic/pages/check_batchcode.dart';
import 'package:check_your_cosmetic/pages/check_ingredients.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check Your Cosmetic',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CheckBatchcodeFormPage(),
      // home: TabBar(
      //   tabs: [
      //     CheckBatchcodeFormPage(),
      //     CheckIngredientsPage(),
      //   ],
    );
  }
}
