class Product {
  const Product({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    this.category,
    required this.image,
  });

  final int id;
  final String title;
  final String price;
  final String description;
  final String? category;
  final String image;

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      title: json['title'],
      price: json['price'].toString(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
    );
  }
}

abstract class Products {
  Products(this.typeOfProducts);

  final String typeOfProducts;
}

class TestProducts extends Products {
  TestProducts(super.typeOfProducts);
}
