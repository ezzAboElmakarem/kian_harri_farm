// ignore_for_file: constant_identifier_names

class Endpoints {
  static const String REGISTER = "register";
  static const String LOGIN = "login";
  static const String FORGET_PASSWORD = "resendcode";
  static const String VERIFY_CODE = "verifycode";
  static const String CHANGE_PASSWORD = "changePassword";
  static const String HOME = "home";
  static const String SEARCH = "search";
  static const String ALLOFFERES = "show-all-offer";
  static const String NOTIFICATION = "notifications";
  static const String USER = "user";
  static const String UPDATE = "update";
  static const String SERVICE_RATE = "rate-service";
  static const String GET_ORDERS = "get-orders";
  static const String GET_ORDERS_DETAILS = "order-details";
  static String subCat({required String catId}) {
    return "category/$catId/subcategory";
  }

  static String subCategoryOffers({
    required String subId,
  }) {
    return "category/$subId/offers";
  }

  static String filters({
    required String catId,
  }) {
    return "category/$catId/offers";
  }
}
