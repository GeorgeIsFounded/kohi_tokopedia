import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginWithPhoneNumberController extends GetxController {
  //TODO: Implement LoginWithPhoneNumberController

  final count = 0.obs;
  TextEditingController phoneNumber = TextEditingController();
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
