import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

class MyOrdersDetailsRepository {
  static Future getMyOrdersDetails({required String orderId}) async {
    return await Network().request(
      Endpoints.GET_ORDERS_DETAILS,
      method: ServerMethods.POST,
      body: {"order_id": orderId},
    );
  }
}
