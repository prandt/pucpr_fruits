class Fruit {
  final int id;
  final String name;
  final String genus;
  final int calories;
  final double sugar;
  final double carbohydrates;

  const Fruit({
    required this.id,
    required this.name,
    required this.calories,
    required this.genus,
    required this.sugar,
    required this.carbohydrates
  });

  factory Fruit.fromJson(Map<String, dynamic> json) {
    return Fruit(
        id: json['id'],
        name: json['name'],
        genus: json['genus'],
        calories: json['nutritions']['calories'],
        sugar: json['nutritions']['sugar'],
        carbohydrates: json['nutritions']['carbohydrates']
    );
  }
}