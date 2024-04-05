import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class AllOffersRepo {
  static Future getData() async {
    return await Network().request(
      Endpoints.ALLOFFERES,
      method: ServerMethods.GET,
    );
  }
}
