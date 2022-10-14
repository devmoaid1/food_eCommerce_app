import 'package:equatable/equatable.dart';
import 'package:flutter_task_app/data/models/product.dart';

class Deal extends Equatable {
  final Product? product;
  final int? distance;

  const Deal({this.product, this.distance});

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
        product: Product.fromJson(json["product"]),
        distance: json['distance'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'product': product!.toJson(),
        'distance': distance,
      };

  @override
  List<Object?> get props => [product, distance];
}
