import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class PaymentRepository {
  static Future addPaymentOrder({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.MAKE_ORDER,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
