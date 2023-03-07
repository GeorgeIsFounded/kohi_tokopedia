import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

import '../controllers/home_admin_controller.dart';

class HomeAdminView extends GetView<HomeAdminController> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Container(
        child: Column(
          children: [
            Container(
              width: lebar,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.HOME);
                    },
                    child: Container(
                      child: Icon(
                        Icons.chevron_left_rounded,
                        size: 30,
                      ),
                    ),
                  ),
                  Container(child: Text("Menu"))
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 10,
                children: [
                  CustomMenu(
                      icon: '../../../../../assets/menu/promo.png',
                      text: "Promo Hari Ini"),
                  CustomMenu(
                      icon: '../../../../../assets/menu/toserba.png',
                      text: "Toserba"),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                Get.toNamed(Routes.HOME);
              },
              child: Container(
                child: Icon(
                  Icons.chevron_left_rounded,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}

Widget CustomMenu({icon, text, width}) {
  return InkWell(
    onTap: () {
      Get.toNamed(Routes.SLIDER_DATA);
    },
    child: Container(
      height: 100,
      width: 79,
      child: Column(
        children: [
          Container(
            width: width,
            height: 50,
            child: Image.asset(icon),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}
