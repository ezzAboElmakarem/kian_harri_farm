import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class CategoriesRepo {
  static Future getData({required String catId}) async {
    return await Network().request(
      Endpoints.subCat(catId: catId),
      method: ServerMethods.GET,
    );
  }
}
