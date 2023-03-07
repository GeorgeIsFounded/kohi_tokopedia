import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/splash_screen_controller.dart';

class SplashScreenView extends GetView<SplashScreenController> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        height: tinggi,
        padding: EdgeInsets.fromLTRB(30, 50, 30, 20),
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [bgLogin, bgLogin2])),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // decoration: BoxDecoration(
              //     image: DecorationImage(
              //         image: AssetImage("../../../../../assets/sp.png"),
              //         fit: BoxFit.fill)),
              // margin: EdgeInsets.only(bottom: 20),
              child: Image.asset("../../../../../assets/sp.png"),
              margin: EdgeInsets.only(bottom: 20),
            ),
            Container(
              width: 300,
              child: Text(
                "Let's Get Started",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 55,
                    fontFamily: "RalewayL"),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              width: 500,
              child: Text(
                "Connect with each other with chatting or calling. Enjoy safe and private texting",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w100),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: Size(500, 60),
                ),
                onPressed: () {},
                child: Text(
                  "Join Now",
                  style: TextStyle(color: bgLogin2),
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.LOGIN);
              },
              child: Container(
                width: lebar,
                margin: EdgeInsets.only(top: 50),
                child: Center(
                    child: Text(
                  "Already have an account? Login",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )),
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.LOGIN_WITH_PHONE_NUMBER);
              },
              child: Container(
                width: lebar,
                margin: EdgeInsets.only(top: 5),
                child: Center(
                    child: Text(
                  "Or Login with Phone Number",
                  style: TextStyle(color: Colors.white, fontSize: 14),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
