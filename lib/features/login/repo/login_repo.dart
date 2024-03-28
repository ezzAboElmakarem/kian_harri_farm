import 'package:kian_sheeps_projects/core/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class LoginRepo {
  static Future login({required Map<String, dynamic> body}) {
    return Network().request(
      Endpoints.LOGIN,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
