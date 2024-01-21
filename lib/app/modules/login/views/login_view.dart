import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:money_track_getx/app/routes/app_pages.dart';

import '../../../../common/Colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();
    TextEditingController passwordC = TextEditingController();
    final LoginController loginC = Get.find();

    return DecoratedBox(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColors.purpleMedium, AppColors.yellowMedium],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: Get.height * 0.2,
                width: Get.width,
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  "Log in to My Expenses",
                  style: TextStyle(
                    fontSize: 26,
                    color: Colors.white,
                  ),
                ),
              ),
              Container(
                height: Get.height * 0.12,
                width: Get.width,
                // color: Colors.blueAccent,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Email",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: emailC,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        // labelText: 'Email',
                        hintText: 'example@mail.com',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, // Warna border disini
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, // Warna border disini
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, // Warna border disini
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red, // Warna border disini
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.white, // Warna border disini
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your email';
                        }
                        // You can add more sophisticated email validation here
                        // using regular expressions or other methods
                        if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                            .hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height * 0.12,
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const Text(
                      "Password",
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: passwordC,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        // labelText: 'Email',
                        hintText: 'Your password',
                        hintStyle: TextStyle(color: Colors.white),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.whiteColor, // Warna border disini
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.whiteColor, // Warna border disini
                          ),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.grey, // Warna border disini
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.red, // Warna border disini
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: AppColors.whiteColor, // Warna border disini
                          ),
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye_outlined,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter your password';
                        }
                        // // You can add more sophisticated email validation here
                        // // using regular expressions or other methods
                        // if (!RegExp(r"^[a-zA-Z0-9_.+-]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$")
                        //     .hasMatch(value)) {
                        //   return 'Please enter a valid email address';
                        // }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: Get.height * 0.05,
                width: Get.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forgot Password?",
                    style: TextStyle(color: AppColors.whiteColor),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.1),
              InkWell(
                onTap: () async {
                  // Aksi yang dijalankan saat tombol login ditekan
                  // print('Tombol Login Ditekan');

                  // loginC.loginUser(emailC.text, passwordC.text);
                },
                child: Container(
                  width: Get.width * 0.9,
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: AppColors.purpleMedium,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  child: const Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Get.height * 0.02),
              Container(
                height: 2,
                width: Get.width,
                color: AppColors.whiteColor,
                margin: const EdgeInsets.symmetric(horizontal: 75),
              ),
              SizedBox(height: Get.height * 0.02),
              Column(
                children: [
                  const Text("Atau login dengan", style: TextStyle(color: AppColors.whiteColor)),
                  Container(
                    margin: const EdgeInsets.only(top: 40, bottom: 20),
                    padding: const EdgeInsets.only(left: 25, right: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            loginC.handleSignInGoogle();
                          },
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              width: 40,
                              height: 40,
                              color: AppColors.whiteColor,
                              child: Image.asset("assets/icons/google.png"),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.HOME);
                          },
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset("assets/icons/apple.png"),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed(Routes.HOME);
                          },
                          child: SizedBox(
                            width: 40,
                            height: 40,
                            child: Image.asset("assets/icons/facebook.png"),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
