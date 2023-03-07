import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/forgot_password_controller.dart';

class ForgotPasswordView extends GetView<ForgotPasswordController> {
  final authController = Get.put(AuthControllerController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: Container(
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
                            "Reset Password",
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            width: 300,
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              "Enter the email associated with your account and we'll send an email with instructions to reset your password.",
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ],
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
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: controller.email,
                                    decoration: InputDecoration(
                                      hintText: "hiamirizqi@gmail.com",
                                      labelText: "Enter your email address",
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
                          onPressed: () => authController
                              .resetPassword(controller.email.text),
                          child: Text(
                            "Send Instructions",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
