import 'dart:convert';

class Item {
  String item;
  int price;

  Item({
    required this.item,
    required this.price,
  });

  Item copyWith({
    String? item,
    int? price,
  }) =>
      Item(
        item: item ?? this.item,
        price: price ?? this.price,
      );

  factory Item.fromRawJson(String str) => Item.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Item.fromJson(Map<String, dynamic> json) => Item(
    item: json["item"],
    price: json["price"] is String?int.tryParse(json["price"]) ?? 0 :json["price"],
  );

  Map<String, dynamic> toJson() => {
    "item": item,
    "price": price,
  };
}
