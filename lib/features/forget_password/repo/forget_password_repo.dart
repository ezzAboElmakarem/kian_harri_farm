import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class ForgetPasswordRepo {
  static Future sendCode({required String body}) async {
    return Network().request(
      Endpoints.FORGET_PASSWORD,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
