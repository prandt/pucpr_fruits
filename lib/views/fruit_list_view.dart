import 'package:flutter/material.dart';

import '../widgets/fruits_list.dart';

class FruitListView extends StatefulWidget {
  const FruitListView({Key? key}) : super(key: key);

  @override
  State<FruitListView> createState() => _FruitListViewState();
}

class _FruitListViewState extends State<FruitListView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 2.5,
        title: const Text('Fruits list'),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 142, 4, 173),
      ),
      body: const Center(
        child: FruitsList(),
      ),
    );
  }
}