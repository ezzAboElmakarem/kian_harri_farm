import 'advert.dart';
import 'banner.dart';
import 'category.dart';
import 'product.dart';

class Data {
  List<Category>? category;
  List<Product>? products;
  List<Banner>? banner;
  List<dynamic>? offer;
  Advert? advert;
  int? notification;

  Data({
    this.category,
    this.products,
    this.banner,
    this.offer,
    this.advert,
    this.notification,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        category: (json['category'] as List<dynamic>?)
            ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
            .toList(),
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        banner: (json['banner'] as List<dynamic>?)
            ?.map((e) => Banner.fromJson(e as Map<String, dynamic>))
            .toList(),
        offer: json['offer'] as List<dynamic>?,
        advert: json['advert'] == null
            ? null
            : Advert.fromJson(json['advert'] as Map<String, dynamic>),
        notification: json['notification'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'category': category?.map((e) => e.toJson()).toList(),
        'products': products?.map((e) => e.toJson()).toList(),
        'banner': banner?.map((e) => e.toJson()).toList(),
        'offer': offer,
        'advert': advert?.toJson(),
        'notification': notification,
      };
}
