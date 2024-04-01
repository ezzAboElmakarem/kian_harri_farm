import 'data.dart';

class HomeModel {
  bool? success;
  Data? data;
  String? message;

  HomeModel({this.success, this.data, this.message});

  factory HomeModel.fromJson(Map<String, dynamic> json) => HomeModel(
        success: json['success'] as bool?,
        data: json['data'] == null
            ? null
            : Data.fromJson(json['data'] as Map<String, dynamic>),
        message: json['message'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'success': success,
        'data': data?.toJson(),
        'message': message,
      };
}
