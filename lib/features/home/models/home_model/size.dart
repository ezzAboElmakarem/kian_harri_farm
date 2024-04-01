class Size {
  int? id;
  String? name;
  String? price;
  String? priceAfterDiscount;

  Size({this.id, this.name, this.price, this.priceAfterDiscount});

  factory Size.fromJson(Map<String, dynamic> json) => Size(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as String?,
        priceAfterDiscount: json['price_after_discount'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'price_after_discount': priceAfterDiscount,
      };
}
