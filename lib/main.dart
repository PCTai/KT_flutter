import 'package:flutter/material.dart';
import 'package:project_study/product_provider.dart';
import 'package:project_study/productlist_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProductProvider()),
      ],
      child: MaterialApp(
        home: ProductListPage(),
      ),
    );
  }
}
