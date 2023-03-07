import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';

import '../controllers/update_slider_controller.dart';

class UpdateSliderView extends GetView<UpdateSliderController> {
  final authController = Get.put(AuthControllerController());
  final sliderC = Get.put(SliderController());
  final data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Data'),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.only(top: 50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Image",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.imageSlider,
                    decoration: InputDecoration(
                      hintText: "https://",
                      labelText: "image",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Description",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    controller: controller.description,
                    decoration: InputDecoration(
                      hintText: "Description",
                      labelText: "desc",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            Switch(
                value: controller.active.value,
                onChanged: (value) => controller.changeActivation()),
            Container(
              margin: EdgeInsets.only(top: 20, left: 18, right: 18),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  minimumSize: Size(500, 55),
                ),
                onPressed: () => sliderC.updateData(
                    data?.id,
                    controller.active.value,
                    controller.description.text,
                    controller.imageSlider.text),
                child: Text(
                  "Update",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
