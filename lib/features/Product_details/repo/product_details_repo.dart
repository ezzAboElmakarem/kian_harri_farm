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

  static Future addToCart({required Map<String, dynamic> body}) async {
    return await Network().request(
      Endpoints.ADD_TO_CART,
      method: ServerMethods.POST,
      body: body,
    );
  }
}
