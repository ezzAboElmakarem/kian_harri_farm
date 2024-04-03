import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class SearchRepo {
  static Future getData({required String searchQuery}) async {
    return await Network().request(
      Endpoints.SEARCH,
      body: {"offer": searchQuery},
      method: ServerMethods.POST,
    );
  }
}
