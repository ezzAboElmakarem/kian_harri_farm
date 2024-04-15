import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

class ServiceRateRepository {
  static Future sendRate({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.SERVICE_RATE,
      method: ServerMethods.POST,
      body: body,
    );
  }
}
