import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class SignupRepository {
  static Future signUp({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.REGISTER,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
