class ProductModel {
  final String id;
  final String title;
  final String description;
  final double price;

  ProductModel({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
  });
}

final List<ProductModel> productList = [
  ProductModel(
      id: '1',
      title: 'Red Shirt',
      description: 'A red shirt - it is pretty red!',
      price: 29.99),
  ProductModel(
      id: '2',
      title: 'Trousers',
      description: 'A nice pair of trousers.',
      price: 59.99),
  ProductModel(
      id: '3',
      title: 'Yellow Scarf',
      description: 'Warm and cozy - exactly what you need for the winter.',
      price: 19.99),
  ProductModel(
      id: '4',
      title: 'A Pan',
      description: 'Prepare any meal you want.',
      price: 49.99),
];
