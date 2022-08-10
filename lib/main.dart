import 'package:coffee_shop_raja_yogan/pages/dashboard.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Coffee Brew Demo',
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}
