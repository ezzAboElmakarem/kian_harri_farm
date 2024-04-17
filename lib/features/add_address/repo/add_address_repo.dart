import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

class AddAddressRepository {
  static Future addAddress({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.ADD_ADDRESS,
      method: ServerMethods.POST,
      body: body,
    );
  }

  static Future getCities() async {
    return await Network().request(
      Endpoints.GET_CITIES,
      method: ServerMethods.GET,
    );
  }

  static Future getRegions({
    required String cityId, // Change the parameter type to String
  }) async {
    return await Network().request(
      Endpoints.getRegions(
        cityId: cityId,
      ),
      method: ServerMethods.GET,
    );
  }
}
