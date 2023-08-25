import 'package:flutter/material.dart';
import 'package:pucpr_fruits/views/fruit_list_view.dart';
import 'package:pucpr_fruits/views/fruit_view.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fruits',
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const FruitListView(),
        '/fruit': (BuildContext context) => const FruitView(),
      }
    );
  }
}
