class Cutting {
  int? id;
  String? name;
  String? price;

  Cutting({this.id, this.name, this.price});

  factory Cutting.fromJson(Map<String, dynamic> json) => Cutting(
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
