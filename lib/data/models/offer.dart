import 'package:equatable/equatable.dart';
import 'package:flutter_task_app/data/models/product.dart';

class Offer extends Equatable {
  final Product? product;
  final String? dueDate;

  const Offer({this.product, this.dueDate});

  factory Offer.fromJson(Map<String, dynamic> json) => Offer(
        product: Product.fromJson(json["product"]),
        dueDate: json['dueDate'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'product': product!.toJson(),
        'dueDate': dueDate,
      };

  @override
  List<Object?> get props => [product, dueDate];
}
