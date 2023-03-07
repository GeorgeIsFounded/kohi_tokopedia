import 'package:get/get.dart';

import '../controllers/login_with_phone_number_controller.dart';

class LoginWithPhoneNumberBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LoginWithPhoneNumberController>(
      () => LoginWithPhoneNumberController(),
    );
  }
}
