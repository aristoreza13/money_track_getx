import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_track_getx/app/routes/app_pages.dart';
import 'package:money_track_getx/helpers/data_preferences.dart';

class LoginController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  Future<void> handleSignInGoogle() async {
    try {
      GoogleSignInAccount? googleAccount = await _googleSignIn.signIn();
      print(googleAccount!);
      await DataPreferences.setEmail(googleAccount.email);
      await DataPreferences.setDisplayName(googleAccount.displayName!);
      await DataPreferences.setPhotoUrl(googleAccount.photoUrl!);
      await DataPreferences.setLoggedIn();
      Get.offAllNamed(Routes.NAVIGATOR);
    } catch (error) {
      print('Error signing in with Google: $error');
      _googleSignIn.disconnect();
    }
  }

  void loginUser(String email, password) async {
    await DataPreferences.setEmail(email);
    await DataPreferences.setPassword(password);
    await DataPreferences.setLoggedIn();
    Get.offAllNamed(Routes.NAVIGATOR);
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
