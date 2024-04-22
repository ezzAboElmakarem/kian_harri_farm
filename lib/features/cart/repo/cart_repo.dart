import 'package:kian_sheeps_projects/app_config/app_end_points.dart';
import 'package:kian_sheeps_projects/network/network_layer.dart';

abstract class CartRepo {
  static Future getData() async {
    return await Network().request(
      Endpoints.SHOW_CART,
      method: ServerMethods.GET,
    );
  }

  static Future deleteCartItem({required Map<String, dynamic> body}) {
    return Network().request(
      Endpoints.DELETE_CART_ITEM,
      body: body,
      method: ServerMethods.POST,
    );
  }

  static Future deleteAllCart() async {
    return await Network().request(
      Endpoints.DELETE_ALL_CART,
      method: ServerMethods.GET,
    );
  }

  static Future activeCoupon({required Map<String, dynamic> body}) {
    return Network().request(
      Endpoints.ADD_COUPON,
      body: body,
      method: ServerMethods.POST,
    );
  }

  static Future increaseItem({required Map<String, dynamic> body}) {
    return Network().request(
      Endpoints.INCREASE_CART_ITEM,
      body: body,
      method: ServerMethods.POST,
    );
  }

  static Future decreaseItem({required Map<String, dynamic> body}) {
    return Network().request(
      Endpoints.DECREASE_CART_ITEM,
      body: body,
      method: ServerMethods.POST,
    );
  }
}
