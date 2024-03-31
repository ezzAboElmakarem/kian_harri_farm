import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class ResetPasswordRepository {
  static Future resetPasword({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.CHANGE_PASSWORD,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
