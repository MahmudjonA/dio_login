class Product {
  final String title;
  final String image;

  Product({required this.title, required this.image});

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      title: json['title'],
      image: json['thumbnail'],
    );
  }
}

