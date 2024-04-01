class SimilarProduct {
  int? id;
  String? name;
  String? price;
  String? discount;
  String? discountType;
  String? category;
  String? offerPrice;
  String? description;
  String? image;
  bool? like;
  int? rateavg;

  SimilarProduct({
    this.id,
    this.name,
    this.price,
    this.discount,
    this.discountType,
    this.category,
    this.offerPrice,
    this.description,
    this.image,
    this.like,
    this.rateavg,
  });

  factory SimilarProduct.fromJson(Map<String, dynamic> json) {
    return SimilarProduct(
      id: json['id'] as int?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      discount: json['discount'] as String?,
      discountType: json['discountType'] as String?,
      category: json['category'] as String?,
      offerPrice: json['offer_price'] as String?,
      description: json['description'] as String?,
      image: json['image'] as String?,
      like: json['like'] as bool?,
      rateavg: json['rateavg'] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'discount': discount,
        'discountType': discountType,
        'category': category,
        'offer_price': offerPrice,
        'description': description,
        'image': image,
        'like': like,
        'rateavg': rateavg,
      };
}
