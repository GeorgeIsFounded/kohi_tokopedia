import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';

import '../../../../config/warna.dart';
import '../../../routes/app_pages.dart';
import '../controllers/login_with_phone_number_controller.dart';

class LoginWithPhoneNumberView extends GetView<LoginWithPhoneNumberController> {
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
                      Row(
                        children: [
                          Text(
                            "Login with phone number",
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
                              "On this application you can also login with your own beautiful phone number now, We'll send you an OTP code SMS. Make no one knows.",
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
                                    "Phone Number",
                                    style:
                                        TextStyle(fontWeight: FontWeight.w600),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  TextField(
                                    controller: controller.phoneNumber,
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
                          onPressed: () {
                            authController
                                .verifyPhone(controller.phoneNumber.text);
                          },
                          child: Text(
                            "Send OTP",
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
