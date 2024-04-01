class Addition {
  int? id;
  String? name;
  String? price;

  Addition({this.id, this.name, this.price});

  factory Addition.fromJson(Map<String, dynamic> json) => Addition(
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
