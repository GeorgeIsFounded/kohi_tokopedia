import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  final authController = Get.put(AuthControllerController());
  final controller = Get.put(RegisterController());
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
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
                        Container(
                          alignment: Alignment.topLeft,
                          child: InkWell(
                            onTap: () {
                              Get.toNamed(Routes.LOGIN);
                            },
                            child: Icon(Icons.arrow_back_rounded),
                          ),
                        ),
                        Row(
                          children: [
                            Text(
                              "Create Account",
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
                            "Connect with your friends today!",
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Email Address",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 10,
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
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Phone Number",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      decoration: InputDecoration(
                                        prefixIcon: Container(
                                            padding: EdgeInsets.all(10),
                                            child: Text(
                                              "+61",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.grey),
                                            )),
                                        hintText: "Phone Number",
                                        labelText: "Phone Number",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Password",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      height: 10,
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
                                          onPressed: () =>
                                              controller.changeEye(),
                                          icon: Icon(controller.showhidepw.value
                                              ? Icons.visibility_outlined
                                              : Icons.visibility_off_outlined),
                                        ),
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 50),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: bgLogin2,
                              minimumSize: Size(500, 55),
                            ),
                            onPressed: () => authController.signUp(
                                controller.email.text,
                                controller.password.text),
                            child: Text(
                              "Register",
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
                                  "Or Sign Up with",
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
                                    onPressed: () {},
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
                                onTap: () {},
                                child: Container(
                                  height: 60,
                                  width: 200,
                                  child: OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.white,
                                      minimumSize: Size(200, 50),
                                    ),
                                    onPressed: () {},
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
                        child: Text("Already have an account? "),
                      ),
                      InkWell(
                        onTap: () {
                          Get.toNamed(Routes.LOGIN);
                        },
                        child: Container(
                          child: Text(
                            "Sign In",
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
