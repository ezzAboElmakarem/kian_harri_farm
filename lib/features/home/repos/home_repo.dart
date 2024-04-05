import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class HomeRepo {
  static Future getData() async {
    return await Network().request(
      Endpoints.HOME,
      method: ServerMethods.GET,
    );
  }
}
