// To parse this JSON data, do
//
//     final fishes = fishesFromJson(jsonString);

import 'dart:convert';

List<Fishes?>? fishesFromJson(String str) => json.decode(str) == null ? [] : List<Fishes?>.from(json.decode(str)!.map((x) => Fishes.fromJson(x)));

String fishesToJson(List<Fishes?>? data) => json.encode(data == null ? [] : List<dynamic>.from(data.map((x) => x!.toJson())));

class Fishes {
  Fishes({
    this.id,
    this.userId,
    this.fishTypeId,
    this.name,
    this.description,
    this.price,
    this.imagePath,
  });

  int? id;
  int? userId;
  int? fishTypeId;
  String? name;
  String? description;
  int? price;
  String? imagePath;

  factory Fishes.fromJson(Map<String, dynamic> json) => Fishes(
    id: json["id"],
    userId: json["user_id"],
    fishTypeId: json["fish_type_id"],
    name: json["name"],
    description: json["description"],
    price: json["price"],
    imagePath: json["image_path"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "fish_type_id": fishTypeId,
    "name": name,
    "description": description,
    "price": price,
    "image_path": imagePath,
  };
}
