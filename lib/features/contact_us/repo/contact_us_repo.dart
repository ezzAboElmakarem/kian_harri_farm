import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class ContactUsRepo {
  static Future getData() async {
    return await Network().request(
      Endpoints.CONTACT_US_LINKS,
      method: ServerMethods.GET,
    );
  }

  static Future sendMessage({required Map<String, dynamic> body}) {
    return Network().request(
      Endpoints.CONTACTUS,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
