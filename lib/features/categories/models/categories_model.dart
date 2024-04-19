import 'package:kian_sheeps_projects/main_models/product_model.dart';

class SubCategoriesModel {
  bool? success;
  Data? data;
  String? message;

  SubCategoriesModel({this.success, this.data, this.message});

  SubCategoriesModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['message'] = message;
    return data;
  }
}

class Data {
  String? name;
  List<SubCategory>? subCategory;
  List<ProductModel>? product;

  Data({this.name, this.subCategory, this.product});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['subCategory'] != null) {
      subCategory = <SubCategory>[];
      json['subCategory'].forEach((v) {
        subCategory!.add(SubCategory.fromJson(v));
      });
    }
    if (json['product'] != null) {
      product = <ProductModel>[];
      json['product'].forEach((v) {
        product!.add(ProductModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (subCategory != null) {
      data['subCategory'] = subCategory!.map((v) => v.toJson()).toList();
    }
    if (product != null) {
      data['product'] = product!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategory {
  int? id;
  String? name;
  String? image;
  String? color;

  SubCategory({this.id, this.name, this.image, this.color});

  SubCategory.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['image'] = image;
    data['color'] = color;
    return data;
  }
}

class Addition {
  int? id;
  String? name;
  String? price;

  Addition({this.id, this.name, this.price});

  Addition.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    return data;
  }
}

class Sizes {
  int? id;
  String? name;
  String? price;
  String? priceAfterDiscount;

  Sizes({this.id, this.name, this.price, this.priceAfterDiscount});

  Sizes.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    priceAfterDiscount = json['price_after_discount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['price_after_discount'] = priceAfterDiscount;
    return data;
  }
}

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

  SimilarProduct(
      {this.id,
      this.name,
      this.price,
      this.discount,
      this.discountType,
      this.category,
      this.offerPrice,
      this.description,
      this.image,
      this.like,
      this.rateavg});

  SimilarProduct.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    discount = json['discount'];
    discountType = json['discountType'];
    category = json['category'];
    offerPrice = json['offer_price'];
    description = json['description'];
    image = json['image'];
    like = json['like'];
    rateavg = json['rateavg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['discount'] = discount;
    data['discountType'] = discountType;
    data['category'] = category;
    data['offer_price'] = offerPrice;
    data['description'] = description;
    data['image'] = image;
    data['like'] = like;
    data['rateavg'] = rateavg;
    return data;
  }
}

class OrderType {
  int? id;
  String? name;

  OrderType({this.id, this.name});

  OrderType.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
