import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_project/counter.dart';
import 'package:provider_project/product.dart';



void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => CartProvider(),
    child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MyApp()
    ),
  )
  );
}
  class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
      return const Product();
    }
  }




