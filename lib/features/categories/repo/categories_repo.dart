import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class CategoriesRepo {
  static Future getData({required String catId}) async {
    return await Network().request(
      Endpoints.subCat(catId: catId),
      method: ServerMethods.GET,
    );
  }

  static Future getCategoryOffersData({
    required String subId,
  }) async {
    return await Network().request(
      Endpoints.subCategoryOffers(
        subId: subId,
      ),
      method: ServerMethods.GET,
    );
  }

  static Future filter({
    required String catId,
    required String filterId,
  }) async {
    return await Network().request(
      Endpoints.subCategoryOffers(
        subId: catId,
      ),
      method: ServerMethods.GET,
      query: {"type": filterId},
    );
  }
}
