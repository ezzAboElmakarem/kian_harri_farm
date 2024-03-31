import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class VerifyCodeRepository {
  static Future verifyCode({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.VERIFY_CODE,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
