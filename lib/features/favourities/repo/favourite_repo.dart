import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

class FavouriteRepository {
  static Future getData() async {
    return await Network().request(
      Endpoints.FAVOURITE,
      method: ServerMethods.GET,
    );
  }

  static Future setFavorite({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.LIKE,
      method: ServerMethods.POST,
      body: body,
    );
  }
}
