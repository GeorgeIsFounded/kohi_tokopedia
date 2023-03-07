import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';

class CreateSliderController extends GetxController {
  //TODO: Implement CreateSliderController

  final count = 0.obs;
  final active = true.obs;
  changeActivation() => active.toggle();
  uploadGambar() async{
    String data = await SliderController().addPhoto();
    imageSlider.text = data;
    print(data);
  }

  TextEditingController imageSlider = TextEditingController();
  TextEditingController description = TextEditingController();
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;
}
