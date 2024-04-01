import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class HomeRepo {
  static Future getData() {
    return Network().request(
      Endpoints.HOME,
      method: ServerMethods.GET,
    );
  }
}
