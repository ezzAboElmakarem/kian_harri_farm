import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

class AboutUsRepositroy {
  static Future getAbouUsData() async {
    return await Network().request(
      Endpoints.ABOUT_US,
      method: ServerMethods.GET,
    );
  }
}
