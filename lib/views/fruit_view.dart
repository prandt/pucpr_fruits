
import 'package:flutter/material.dart';
import 'package:pucpr_fruits/models/fruit.dart';

class FruitView extends StatelessWidget {
  const FruitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final fruit = ModalRoute.of(context)!.settings.arguments as Fruit;

    return Scaffold(
      appBar: AppBar(
        elevation: 2.5,
        title: Text(fruit.name),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 142, 4, 173),
      ),
      body: Center(
        child: Card(
          elevation: 2.5,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              textDirection: TextDirection.ltr,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(fruit.name, style: const TextStyle(fontSize: 24.0, color: Color.fromARGB(255, 142, 4, 173))),
                Text('${fruit.calories} calories'),
                Text('${fruit.sugar}g of sugar'),
                Text('${fruit.carbohydrates}g of carbohydrates'),
              ],
            ),
          )
        )
      ),
    );
  }
}