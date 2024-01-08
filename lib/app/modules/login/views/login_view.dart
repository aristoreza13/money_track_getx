import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../../common/Colors.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    TextEditingController emailC = TextEditingController();
    TextEditingController passwordC = TextEditingController();
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
                // color: Colors.blueAccent,
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
                        suffixIcon: Icon(Icons.remove_red_eye_outlined),
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
              Container(),
            ],
          ),
        ),
      ),
    );
  }
}
