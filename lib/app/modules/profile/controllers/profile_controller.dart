import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:money_track_getx/app/routes/app_pages.dart';
import 'package:money_track_getx/helpers/data_preferences.dart';

class ProfileController extends GetxController {
  final GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);

  var nameText = "".obs;
  var photoUrl = "".obs;
  var emailText = "".obs;
  var passwordText = "".obs;

  Future<void> handleLogout() async {
    await _googleSignIn.disconnect();
    await DataPreferences.clear();
    Get.offAllNamed(Routes.LOGIN);
  }

  @override
  void onInit() {
    nameText.value = DataPreferences.getDisplayName()!;
    photoUrl.value = DataPreferences.getPhotoUrl()!;
    emailText.value = DataPreferences.getEmail()!;
    // passwordText.value = DataPreferences.getPassword()!;
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
