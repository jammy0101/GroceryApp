class Product {
  final String name;
  final double price;
  final String image;
  final String description;

  Product({
    required this.name,
    required this.price,
    required this.image,
    required this.description,
  });
}

final List<Product> topProducts = [
  Product(
    name: 'Egg',
    price: 5.00,
    image: 'assets/images/egg.jpg',
    description: 'A versatile and nutritious ingredient, perfect for cooking or baking, rich in protein and essential nutrients.',
  ),
  Product(
    name: 'Jhotpot Chicken',
    price: 5.00,
    image: 'assets/images/jhotpot.jpg',
    description:
        'Jhotpot Chicken is a quick and spicy Bangladeshi-style chicken dish made with tender chicken pieces,"" aromatic spices, and a burst of flavor — perfect for weeknight meals or when you',
  ),
  Product(
    name: 'Perrier',
    price: 5.00,
    image: 'assets/images/perrier.jpeg',
    description:
        'Refreshing sparkling mineral water sourced from the Perrier spring in France, known for its crisp bubbles and natural taste',
  ),
];
