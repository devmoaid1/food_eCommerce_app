import 'dart:convert';

import 'package:equatable/equatable.dart';

class Address extends Equatable {
  final String? title;
  final String? street;
  final String? floor;
  final String? type;

  const Address({this.title, this.street, this.floor, this.type});

  factory Address.fromTitleStreetFloorType(Map<String, dynamic> data) {
    return Address(
      title: data['title'] as String?,
      street: data['street'] as String?,
      floor: data['floor'] as String?,
      type: data['type'] as String?,
    );
  }

  Map<String, dynamic> toTitleStreetFloorType() => {
        'title': title,
        'street': street,
        'floor': floor,
        'type': type,
      };

  factory Address.fromJson(String data) {
    return Address.fromTitleStreetFloorType(
        json.decode(data) as Map<String, dynamic>);
  }

  String toJson() => json.encode(toTitleStreetFloorType());

  Address copyWith({
    String? title,
    String? street,
    String? floor,
    String? type,
  }) {
    return Address(
      title: title ?? this.title,
      street: street ?? this.street,
      floor: floor ?? this.floor,
      type: type ?? this.type,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [title, street, floor, type];
}
