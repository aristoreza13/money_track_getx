import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_track_getx/app/routes/app_pages.dart';
import 'package:money_track_getx/helpers/data_preferences.dart';

import '../../../../common/Colors.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ProfileController profileC = Get.find();
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(Get.height * 0.3),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                    colors: [AppColors.yellowLight, AppColors.purpleLight],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                CircleAvatar(
                  backgroundColor: AppColors.purpleMedium,
                  radius: 60.0,
                  backgroundImage: profileC.photoUrl.value == ""
                      ? const AssetImage('assets/images/goat.png') as ImageProvider
                      : NetworkImage(
                          profileC.photoUrl.value,
                        ),
                ),
                const SizedBox(height: 16.0),
                Obx(
                  () => Text(
                    profileC.nameText.value,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Obx(
                  () => Text(
                    profileC.emailText.value, // Ganti dengan alamat email pengguna Anda
                    style: const TextStyle(
                      fontSize: 16.0,
                      color: Colors.grey,
                    ),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            children: [
              Container(
                height: Get.height * 0.4,
                // color: Colors.grey,
                child: const Column(
                  children: [
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(Icons.settings),
                        title: Text("Account Settings"),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(Icons.privacy_tip),
                        title: Text("Privacy"),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(Icons.lock),
                        title: Text("Reset Password"),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(Icons.language),
                        title: Text("Language"),
                      ),
                    ),
                    Card(
                      elevation: 3,
                      child: ListTile(
                        leading: Icon(Icons.help),
                        title: Text("Help"),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              SizedBox(
                height: Get.height * 0.12,
                child: Center(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(backgroundColor: AppColors.purpleMedium),
                    onPressed: () async {
                      profileC.handleLogout();
                    },
                    child: const Text('Logout'),
                  ),
                ),
              ),
              // ElevatedButton(
              //   onPressed: () async {
              //     profileC.handleLogout();
              //   },
              //   child: const Text('Logout'),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
