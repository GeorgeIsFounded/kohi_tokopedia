import 'package:external_app_launcher/external_app_launcher.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';
import 'package:url_launcher/url_launcher.dart';

import '../controllers/check_email_controller.dart';

class CheckEmailView extends GetView<CheckEmailController> {
  final Uri _url = Uri.parse('https://mail.google.com');
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: lebar,
            height: tinggi * 0.95,
            child: Column(
              children: [
                Column(
                  children: [
                    Container(
                      width: 300,
                      height: 300,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  "../../../../../assets/email.png"))),
                    )
                  ],
                ),
                Column(
                  children: [
                    Text(
                      "Check Your Email",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    Container(
                      width: 300,
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        "We have sent a password recover instructions to your email.",
                        style: TextStyle(color: Colors.grey),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: bgLogin2,
                      minimumSize: Size(200, 55),
                    ),
                    onPressed: _launchUrl,
                    child: Text(
                      "Send Instructions",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.LOGIN);
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Text(
                      "Skip, I'll confirm later",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            width: 330,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                      "Did not receive the email ? Check your spam filter, or "),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.FORGOT_PASSWORD);
                  },
                  child: Container(
                    child: Text(
                      "try another email address",
                      style: TextStyle(color: bgLogin2),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
