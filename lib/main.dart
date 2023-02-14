import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetx/ui/screens/product_screen.dart';
import 'package:testgetx/utility/binding.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      initialBinding: HomeBinding(),
      home: ProductScreen(),
    );
  }
}
