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
  static const String FAVOURITE = "favorite";
  static const String LIKE = "like";
  static const String FETCH_ADDRESS = "fetch-address";
  static const String ABOUT_US = "aboutus";
  static const String COMMON_QUES = "qustions";
  static const String PRIVACY_POLICY = "privacy";
  static const String SHIPPING_POLICY = "shipping_delivery";
  static const String EXCHANGE_POLICY = "exchange_policy";
  static const String UPDATE = "update";
  static const String GET_CITIES = "city";
  static const String CONTACTUS = "contactUs";
  static const String CONTACT_US_LINKS = "setting";
  static const String ADD_ADDRESS = "save-address";
  static const String SERVICE_RATE = "rate-service";
  static const String GET_ORDERS = "get-orders";
  static const String GET_ORDERS_DETAILS = "order-details";
  static String subCat({required String catId}) {
    return "category/$catId/subcategory";
  }

  static String getRegions({required String cityId}) {
    return "area/$cityId";
  }

  static String getOfferDetails({required String offerId}) {
    return "offer/$offerId";
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
