import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class UpdateProfileRepo {
  static Future getData() async {
    return await Network().request(
      Endpoints.USER,
      method: ServerMethods.GET,
    );
  }

  static Future updateData({Map<String, dynamic>? data}) async {
    return await Network().request(
      Endpoints.UPDATE,
      method: ServerMethods.POST,
      body: data,
    );
  }
}
