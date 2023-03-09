import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final authController = Get.put(AuthControllerController());
  final controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Obx(() => Scaffold(
          body: Container(
              padding: EdgeInsets.fromLTRB(30, 60, 30, 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: tinggi * 0.87,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Hi, Welcome Back!",
                              style: TextStyle(
                                  fontSize: 30, fontFamily: "RalewayL"),
                            ),
                            Icon(Icons.waving_hand_rounded)
                          ],
                        ),
                        Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.only(top: 10),
                          child: Text(
                            "Hello again, you've been missed!",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email Address",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    controller: controller.email,
                                    decoration: InputDecoration(
                                      hintText: "hiamirizqi@gmail.com",
                                      labelText: "Email Address",
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 30),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Password",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  TextField(
                                    controller: controller.password,
                                    obscureText: controller.showhidepw.value
                                        ? true
                                        : false,
                                    decoration: InputDecoration(
                                      hintText: "Enter your password",
                                      labelText: "Password",
                                      suffixIcon: IconButton(
                                        onPressed: () => controller.changeEye(),
                                        icon: Icon(controller.showhidepw.value
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined),
                                      ),
                                      border: OutlineInputBorder(),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Get.toNamed(Routes.FORGOT_PASSWORD);
                                    },
                                    child: Container(
                                        margin: EdgeInsets.only(top: 5),
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          "Forgot Password?",
                                          style: TextStyle(
                                              color: Colors.grey.shade500),
                                        )),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 70),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: bgLogin2,
                              minimumSize: Size(500, 55),
                            ),
                            onPressed: () => authController.login(
                                controller.email.text,
                                controller.password.text),
                            child: Text(
                              "Login",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                  height: 2,
                                  width: 130,
                                  color: Colors.grey.shade400),
                              Container(
                                child: Text(
                                  "Or Login With",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              Container(
                                  height: 2,
                                  width: 130,
                                  color: Colors.grey.shade400)
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  height: 60,
                                  width: 200,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(200, 50),
                                    ),
                                    onPressed: () {authController.signInWithFacebook();},
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.facebook_rounded,
                                          color: Colors.blue.shade600,
                                          size: 30,
                                        ),
                                        Text(
                                          "Facebook",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () => authController.signInWithGoogle(),
                                child: Container(
                                  height: 60,
                                  width: 200,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(200, 50),
                                    ),
                                    onPressed: () =>
                                        authController.signInWithGoogle(),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          height: 25,
                                          width: 25,
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage(
                                                      "../../../../../assets/google-icon.png"))),
                                        ),
                                        Text(
                                          "Google",
                                          style: TextStyle(color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        child: Text("Don't have an account? "),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.REGISTER);
                        },
                        child: Container(
                          child: Text(
                            "Sign Up",
                            style: TextStyle(color: bgLogin2),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              )),
        ));
  }
}
