import 'package:kian_sheeps_projects/features/splash_screen/views/splash_screen_view.dart';
import 'package:kian_sheeps_projects/helper/routes.dart';
import 'package:get_storage/get_storage.dart';

class AppStorage {
  static GetStorage _box = GetStorage();

  static Future<void> init() async => await GetStorage.init();

  /// save token to check login
  static void cacheToken(String value) => _box.write('token', value);
  static String? get getToken => _box.read('token');
  static bool get isLogged => _box.hasData('token');

  /// check onborading
  static void cacheOnBoarding(bool value) =>
      _box.write('onboarding_completed', value);
  static bool get isOnBoardingComplete =>
      _box.read('onboarding_completed') ?? false;

  static void cacheSocial(String value) => _box.write('social', value);

  static void cacheNotification(bool value) =>
      _box.write('notification', value);

  static void cacheId(var id) => _box.write('id', id);

  // static Future<void> cacheUserToken(UserTokenModel user) async =>
  //     await _box.write('userToken', user.toJson());

  // static UserTokenModel get getUserToken => UserTokenModel.fromJson(_box.read('userToken')) ?? "";

  // static Future<void> cacheUser(UserModel user) async => await _box.write('user', user.toJson());
  // static UserModel get getUserModel => UserModel.fromJson(_box.read('user'));
  // static int get getId => getUserModel.data!.id!;

  static bool? get getNotification => _box.read('notification');

  static String? get currency => _box.read('currency');

  static void removeCache() {
    _box.erase();
  }

  static Future signOut() async {
    await _box.erase();
    print("user isLogged :: $isLogged");
    // CustomNavigator.push(Routes.SPLASH, clean: true);
    RouteUtils.navigateAndPopAll(const SplashScreenView());
  }
}
