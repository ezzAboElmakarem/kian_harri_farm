import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

class CustomerAddressRepositroy {
  static Future getAddressData() async {
    return await Network().request(
      Endpoints.FETCH_ADDRESS,
      method: ServerMethods.GET,
    );
  }
}
