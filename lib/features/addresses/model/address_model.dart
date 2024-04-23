// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/foundation.dart';

class AddressModel {
  bool? success;
  List<Address>? addresses;
  String? message;

  AddressModel({this.success, this.addresses, this.message});

  AddressModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    if (json['data'] != null) {
      addresses = <Address>[];
      json['data'].forEach((v) {
        addresses!.add(Address.fromJson(v));
      });
    }
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['success'] = success;
    if (this.addresses != null) {
      data['data'] = this.addresses!.map((v) => v.toJson()).toList();
    }
    data['message'] = message;
    return data;
  }

  @override
  bool operator ==(covariant AddressModel other) {
    if (identical(this, other)) return true;

    return other.success == success &&
        listEquals(other.addresses, addresses) &&
        other.message == message;
  }

  @override
  int get hashCode => success.hashCode ^ addresses.hashCode ^ message.hashCode;
}

class Address {
  int? id;
  String? name;
  String? phone;
  String? secondphone;
  String? neighborhood;
  String? streetName;
  String? buildingNumber;
  String? lat;
  String? lng;
  String? notes;
  String? city;
  String? country;
  String? address;
  String? addressDetails;

  Address(
      {this.id,
      this.name,
      this.phone,
      this.secondphone,
      this.neighborhood,
      this.streetName,
      this.buildingNumber,
      this.lat,
      this.lng,
      this.notes,
      this.city,
      this.country,
      this.address,
      this.addressDetails});

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    phone = json['phone'];
    secondphone = json['secondphone'];
    neighborhood = json['neighborhood'];
    streetName = json['street_name'];
    buildingNumber = json['building_number'];
    lat = json['lat'];
    lng = json['lng'];
    notes = json['notes'];
    city = json['city'];
    country = json['country'];
    address = json['address'];
    addressDetails = json['address_details'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['phone'] = phone;
    data['secondphone'] = secondphone;
    data['neighborhood'] = neighborhood;
    data['street_name'] = streetName;
    data['building_number'] = buildingNumber;
    data['lat'] = lat;
    data['lng'] = lng;
    data['notes'] = notes;
    data['city'] = city;
    data['country'] = country;
    data['address'] = address;
    data['address_details'] = addressDetails;
    return data;
  }
}
