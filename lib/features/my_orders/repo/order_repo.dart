import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

class MyOrdersRepository {
  static Future getMyOrders() async {
    return await Network().request(
      Endpoints.GET_ORDERS,
      method: ServerMethods.GET,
    );
  }
}
