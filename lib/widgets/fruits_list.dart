import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pucpr_fruits/views/fruit_view.dart';

import '../models/fruit.dart';

class FruitsList extends StatefulWidget {
  const FruitsList({Key? key}) : super(key: key);

  @override
  State<FruitsList> createState() => _FruitsListState();
}

class _FruitsListState extends State<FruitsList> {

  late Future<List<Fruit>> futureFruit;

  Future<List<Fruit>> loadFruits() async {
    final response = await http
      .get(Uri.parse('https://www.fruityvice.com/api/fruit/all'));
    if (response.statusCode == 200) {
      return (jsonDecode(response.body) as List)
        .map((e) => Fruit.fromJson(e))
        .toList();
    } else {
      throw Exception('Failed to load fruits');
    }
  }

  void _tryAgain() {
    setState(() {
      futureFruit = loadFruits();
    });
  }

  @override
  void initState() {
    super.initState();
    futureFruit = loadFruits();
  }
  
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: futureFruit,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ListView(
            padding: const EdgeInsets.all(10),
            children: snapshot.data!.map<Widget>((fruit) {
              return Card(
                child: ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, '/fruit', arguments: fruit);
                  },
                  title: Text(
                      fruit.name,
                      style: const TextStyle(fontSize: 20, color: Color.fromARGB(
                      255, 142, 4, 173))
                  ),
                  subtitle: Text(
                      fruit.genus,
                      style: const TextStyle(fontSize: 15, color: Color.fromARGB(
                      179, 0, 0, 0))
                  ),
                ),
              );
            }).toList());
        } else if (snapshot.hasError) {
          return TextButton(
              onPressed: () =>  _tryAgain(),
              style: ButtonStyle(
                elevation: MaterialStateProperty.all<double>(2.5),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                foregroundColor: MaterialStateProperty.all<Color>(Colors.purple),
                padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.all(10)),
              ),
              child: const Text('Try again'),
          );
        }
        return const CircularProgressIndicator();
      }
    );
  }

}