import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class Category extends Equatable {
  final String? name;
  final String? imagePath;
  final Color? color;

  const Category({this.name, this.imagePath, this.color});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        name: json['name'] as String?,
        imagePath: json['imagePath'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'imagePath': imagePath,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, imagePath];
}
