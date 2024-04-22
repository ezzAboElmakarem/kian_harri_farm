class AddToCardModel {
  bool? success;
  Data? data;
  String? message;

  AddToCardModel({this.success, this.data, this.message});

  AddToCardModel.fromJson(Map<String, dynamic> json) {
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
  int? id;
  String? quantity;
  String? price;
  String? totalPriceBefore;
  String? totalPriceAfter;
  String? image;
  String? name;
  String? description;
  String? sizeName;
  String? cutting;
  String? wrapping;
  String? addition;
  String? excuteTime;

  Data(
      {this.id,
      this.quantity,
      this.price,
      this.totalPriceBefore,
      this.totalPriceAfter,
      this.image,
      this.name,
      this.description,
      this.sizeName,
      this.cutting,
      this.wrapping,
      this.addition,
      this.excuteTime});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quantity = json['quantity'];
    price = json['price'];
    totalPriceBefore = json['total_price_before'];
    totalPriceAfter = json['total_price_after'];
    image = json['image'];
    name = json['name'];
    description = json['description'];
    sizeName = json['sizeName'];
    cutting = json['cutting'];
    wrapping = json['wrapping'];
    addition = json['addition'];
    excuteTime = json['excute_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quantity'] = quantity;
    data['price'] = price;
    data['total_price_before'] = totalPriceBefore;
    data['total_price_after'] = totalPriceAfter;
    data['image'] = image;
    data['name'] = name;
    data['description'] = description;
    data['sizeName'] = sizeName;
    data['cutting'] = cutting;
    data['wrapping'] = wrapping;
    data['addition'] = addition;
    data['excute_time'] = excuteTime;
    return data;
  }
}
