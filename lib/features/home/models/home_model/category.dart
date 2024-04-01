class Category {
  int? id;
  String? name;
  String? image;
  String? color;
  String? numberProducts;

  Category({
    this.id,
    this.name,
    this.image,
    this.color,
    this.numberProducts,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json['id'] as int?,
        name: json['name'] as String?,
        image: json['image'] as String?,
        color: json['color'] as String?,
        numberProducts: json['Number_Products'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'color': color,
        'Number_Products': numberProducts,
      };
}
