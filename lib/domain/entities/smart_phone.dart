import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class Product extends Equatable {
  final List<SmartPhone> products;

  const Product({required this.products});

  @override
  List<Object?> get props => [products];

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
        products: List<SmartPhone>.from(
            json["products"].map((x) => SmartPhone.fromJson(x))));
  }

  Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
      };
}

class SmartPhone extends Equatable {
  final int id;
  final String title;
  final String description;

  const SmartPhone({
    required this.id,
    required this.title,
    required this.description,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [id, title, description];

  factory SmartPhone.fromJson(Map<String, dynamic> json) {
    return SmartPhone(
        id: json['id'], title: json['title'], description: json['description']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'text': title,
      'number': description,
    };
  }
}
