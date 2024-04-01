import 'addition.dart';
import 'cutting.dart';
import 'order_type.dart';
import 'similar_product.dart';
import 'size.dart';
import 'wrapping.dart';

class Product {
  int? id;
  String? name;
  String? price;
  String? discount;
  String? discountType;
  String? category;
  String? offerPrice;
  int? rateavg;
  String? description;
  String? image;
  List<dynamic>? rate;
  int? quantity;
  bool? like;
  List<Addition>? addition;
  List<Wrapping>? wrapping;
  List<Cutting>? cutting;
  List<Size>? sizes;
  List<SimilarProduct>? similarProduct;
  List<OrderType>? orderType;

  Product({
    this.id,
    this.name,
    this.price,
    this.discount,
    this.discountType,
    this.category,
    this.offerPrice,
    this.rateavg,
    this.description,
    this.image,
    this.rate,
    this.quantity,
    this.like,
    this.addition,
    this.wrapping,
    this.cutting,
    this.sizes,
    this.similarProduct,
    this.orderType,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json['id'] as int?,
        name: json['name'] as String?,
        price: json['price'] as String?,
        discount: json['discount'] as String?,
        discountType: json['discountType'] as String?,
        category: json['category'] as String?,
        offerPrice: json['offer_price'] as String?,
        rateavg: json['rateavg'] as int?,
        description: json['description'] as String?,
        image: json['image'] as String?,
        rate: json['rate'] as List<dynamic>?,
        quantity: json['quantity'] as int?,
        like: json['like'] as bool?,
        addition: (json['addition'] as List<dynamic>?)
            ?.map((e) => Addition.fromJson(e as Map<String, dynamic>))
            .toList(),
        wrapping: (json['wrapping'] as List<dynamic>?)
            ?.map((e) => Wrapping.fromJson(e as Map<String, dynamic>))
            .toList(),
        cutting: (json['cutting'] as List<dynamic>?)
            ?.map((e) => Cutting.fromJson(e as Map<String, dynamic>))
            .toList(),
        sizes: (json['sizes'] as List<dynamic>?)
            ?.map((e) => Size.fromJson(e as Map<String, dynamic>))
            .toList(),
        similarProduct: (json['similarProduct'] as List<dynamic>?)
            ?.map((e) => SimilarProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        orderType: (json['OrderType'] as List<dynamic>?)
            ?.map((e) => OrderType.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'price': price,
        'discount': discount,
        'discountType': discountType,
        'category': category,
        'offer_price': offerPrice,
        'rateavg': rateavg,
        'description': description,
        'image': image,
        'rate': rate,
        'quantity': quantity,
        'like': like,
        'addition': addition?.map((e) => e.toJson()).toList(),
        'wrapping': wrapping?.map((e) => e.toJson()).toList(),
        'cutting': cutting?.map((e) => e.toJson()).toList(),
        'sizes': sizes?.map((e) => e.toJson()).toList(),
        'similarProduct': similarProduct?.map((e) => e.toJson()).toList(),
        'OrderType': orderType?.map((e) => e.toJson()).toList(),
      };
}
