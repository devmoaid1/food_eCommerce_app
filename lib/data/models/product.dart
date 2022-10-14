import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final String? name;
  final String? imagePath;
  final int? id;
  final int? stock;
  final int? originalPrice;
  final int? currentPrice;

  const Product({
    this.name,
    this.imagePath,
    this.id,
    this.stock,
    this.originalPrice,
    this.currentPrice,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      name: json['name'] as String?,
      imagePath: json['imagePath'] as String?,
      id: json['id'] as int?,
      stock: json['stock'] as int?,
      originalPrice: json['originalPrice'] as int?,
      currentPrice: json['currentPrice'] as int?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imagePath': imagePath,
      'id': id,
      'stock': stock,
      'originalPrice': originalPrice,
      'currentPrice': currentPrice,
    };
  }

  Product copyWith({
    String? name,
    String? imagePath,
    int? id,
    int? stock,
    int? originalPrice,
    int? currentPrice,
  }) {
    return Product(
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      id: id ?? this.id,
      stock: stock ?? this.stock,
      originalPrice: originalPrice ?? this.originalPrice,
      currentPrice: currentPrice ?? this.currentPrice,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      name,
      imagePath,
      id,
      stock,
      originalPrice,
      currentPrice,
    ];
  }
}
