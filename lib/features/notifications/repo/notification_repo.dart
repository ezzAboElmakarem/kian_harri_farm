import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class NotificationRepo {
  static Future getData() async {
    return await Network().request(
      Endpoints.NOTIFICATION,
      method: ServerMethods.GET,
    );
  }
}
