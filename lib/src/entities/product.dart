import 'package:intl/intl.dart';

/// Product entity representing a product in the system.
/// Contains business logic and validation rules.
class Product {
  final String id;
  final String name;
  final String description;
  final double price;
  final String? imageUrl;
  final int stock;
  final bool isAvailable;
  final DateTime createdAt;

  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    this.imageUrl,
    required this.stock,
    required this.isAvailable,
    required this.createdAt,
  });

  /// Business logic: Check if product is in stock
  /// A product is in stock if it has stock > 0 AND is marked as available
  bool get isInStock => stock > 0 && isAvailable;

  /// Format price with currency symbol
  String get formattedPrice {
    final formatter = NumberFormat.currency(symbol: '\$', decimalDigits: 2);
    return formatter.format(price);
  }

  /// Create a copy of the product with updated fields
  Product copyWith({
    String? id,
    String? name,
    String? description,
    double? price,
    String? imageUrl,
    int? stock,
    bool? isAvailable,
    DateTime? createdAt,
  }) {
    return Product(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      price: price ?? this.price,
      imageUrl: imageUrl ?? this.imageUrl,
      stock: stock ?? this.stock,
      isAvailable: isAvailable ?? this.isAvailable,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Product &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          description == other.description &&
          price == other.price &&
          imageUrl == other.imageUrl &&
          stock == other.stock &&
          isAvailable == other.isAvailable &&
          createdAt == other.createdAt;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      description.hashCode ^
      price.hashCode ^
      imageUrl.hashCode ^
      stock.hashCode ^
      isAvailable.hashCode ^
      createdAt.hashCode;

  @override
  String toString() {
    return 'Product{id: $id, name: $name, price: $price, stock: $stock, isAvailable: $isAvailable}';
  }
}
