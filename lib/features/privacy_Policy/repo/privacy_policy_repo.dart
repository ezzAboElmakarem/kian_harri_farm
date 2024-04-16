import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

class PrivacyPolicyRepository {
  static Future getPrivacyPolicy() async {
    return await Network().request(
      Endpoints.PRIVACY_POLICY,
      method: ServerMethods.GET,
    );
  }
}
