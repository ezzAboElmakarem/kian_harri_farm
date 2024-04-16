import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

class ExchangePolicyRepository {
  static Future getExchangePolicy() async {
    return await Network().request(
      Endpoints.EXCHANGE_POLICY,
      method: ServerMethods.GET,
    );
  }
}
