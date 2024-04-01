class Wrapping {
  int? id;
  String? name;
  String? price;

  Wrapping({this.id, this.name, this.price});

  factory Wrapping.fromJson(Map<String, dynamic> json) => Wrapping(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
      };
}
