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
  static String subCat({required String catId}) {
    return "category/$catId/subcategory";
  }
}
