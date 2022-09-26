// To parse this JSON data, do
//
//     final Prodectmodel = ProdectmodelFromJson(jsonString);

// ignore_for_file: prefer_if_null_operators

import 'dart:convert';

Prodectmodel prodectmodelFromJson(String str) =>
    Prodectmodel.fromJson(json.decode(str));

String prodectmodelToJson(Prodectmodel data) => json.encode(data.toJson());

class Prodectmodel {
  Prodectmodel({
    this.name,
    this.category,
    this.price,
    this.brand,
    this.image,
    this.size,
    this.id,
  });

  String? name;
  String? category;
  int? price;
  String? brand;
  String? image;
  List<dynamic>? size;
  int? id;

  factory Prodectmodel.fromJson(Map<String, dynamic> json) => Prodectmodel(
        name: json["name"] == null ? null : json["name"],
        category: json["category"] == null ? null : json["category"],
        price: json["price"] == null ? null : json["price"],
        brand: json["brand"] == null ? null : json["brand"],
        image: json["image"] == null ? null : json["image"],
        size: json["size"] == null
            ? null
            : List<dynamic>.from(json["size"].map((x) => x)),
        id: json["id"] == null ? null : json["id"],
      );

  Map<String, dynamic> toJson() => {
        "name": name == null ? null : name,
        "category": category == null ? null : category,
        "price": price == null ? null : price,
        "brand": brand == null ? null : brand,
        "image": image == null ? null : image,
        "size": size == null ? null : List<dynamic>.from(size!.map((x) => x)),
        "id": id == null ? null : id,
      };
}
