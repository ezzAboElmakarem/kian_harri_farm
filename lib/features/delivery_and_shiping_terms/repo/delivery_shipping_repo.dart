import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

class ShippingPolicyRepository {
  static Future getShippingPolicy() async {
    return await Network().request(
      Endpoints.SHIPPING_POLICY,
      method: ServerMethods.GET,
    );
  }
}
