import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class ProductDetailsRepo {
  static Future getOfferDetailsData({
    required String offerId,
  }) async {
    return await Network().request(
      Endpoints.getOfferDetails(
        offerId: offerId,
      ),
      method: ServerMethods.GET,
    );
  }
}
