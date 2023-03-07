import 'package:get/get.dart';

import 'package:tokopedia/app/modules/check-email/bindings/check_email_binding.dart';
import 'package:tokopedia/app/modules/check-email/views/check_email_view.dart';
import 'package:tokopedia/app/modules/create_produk/bindings/create_produk_binding.dart';
import 'package:tokopedia/app/modules/create_produk/views/create_produk_view.dart';
import 'package:tokopedia/app/modules/create_slider/bindings/create_slider_binding.dart';
import 'package:tokopedia/app/modules/create_slider/views/create_slider_view.dart';
import 'package:tokopedia/app/modules/detail/bindings/detail_binding.dart';
import 'package:tokopedia/app/modules/detail/views/detail_view.dart';
import 'package:tokopedia/app/modules/detail_produk/bindings/detail_produk_binding.dart';
import 'package:tokopedia/app/modules/detail_produk/controllers/detail_produk_controller.dart';
import 'package:tokopedia/app/modules/detail_produk/views/detail_produk_view.dart';
import 'package:tokopedia/app/modules/forgot-password/bindings/forgot_password_binding.dart';
import 'package:tokopedia/app/modules/forgot-password/views/forgot_password_view.dart';
import 'package:tokopedia/app/modules/home/bindings/home_binding.dart';
import 'package:tokopedia/app/modules/home/views/home_view.dart';
import 'package:tokopedia/app/modules/home_admin/bindings/home_admin_binding.dart';
import 'package:tokopedia/app/modules/home_admin/views/home_admin_view.dart';
import 'package:tokopedia/app/modules/login/bindings/login_binding.dart';
import 'package:tokopedia/app/modules/login/views/login_view.dart';
import 'package:tokopedia/app/modules/loginWithPhoneNumber/bindings/login_with_phone_number_binding.dart';
import 'package:tokopedia/app/modules/loginWithPhoneNumber/views/login_with_phone_number_view.dart';
import 'package:tokopedia/app/modules/otp_verification/bindings/otp_verification_binding.dart';
import 'package:tokopedia/app/modules/otp_verification/views/otp_verification_view.dart';
import 'package:tokopedia/app/modules/produk_data/bindings/produk_data_binding.dart';
import 'package:tokopedia/app/modules/produk_data/views/produk_data_view.dart';
import 'package:tokopedia/app/modules/register/bindings/register_binding.dart';
import 'package:tokopedia/app/modules/register/views/register_view.dart';
import 'package:tokopedia/app/modules/slider_data/bindings/slider_data_binding.dart';
import 'package:tokopedia/app/modules/slider_data/views/slider_data_view.dart';
import 'package:tokopedia/app/modules/splashScreen/bindings/splash_screen_binding.dart';
import 'package:tokopedia/app/modules/splashScreen/views/splash_screen_view.dart';
import 'package:tokopedia/app/modules/update_slider/bindings/update_slider_binding.dart';
import 'package:tokopedia/app/modules/update_slider/views/update_slider_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH_SCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH_SCREEN,
      page: () => SplashScreenView(),
      binding: SplashScreenBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.REGISTER,
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: _Paths.FORGOT_PASSWORD,
      page: () => ForgotPasswordView(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: _Paths.CHECK_EMAIL,
      page: () => CheckEmailView(),
      binding: CheckEmailBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL,
      page: () => DetailView(),
      binding: DetailBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN_WITH_PHONE_NUMBER,
      page: () => LoginWithPhoneNumberView(),
      binding: LoginWithPhoneNumberBinding(),
    ),
    GetPage(
      name: _Paths.OTP_VERIFICATION,
      page: () => OtpVerificationView(),
      binding: OtpVerificationBinding(),
    ),
    GetPage(
      name: _Paths.HOME_ADMIN,
      page: () => HomeAdminView(),
      binding: HomeAdminBinding(),
    ),
    GetPage(
      name: _Paths.SLIDER_DATA,
      page: () => SliderDataView(),
      binding: SliderDataBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_SLIDER,
      page: () => CreateSliderView(),
      binding: CreateSliderBinding(),
    ),
    GetPage(
      name: _Paths.UPDATE_SLIDER,
      page: () => UpdateSliderView(),
      binding: UpdateSliderBinding(),
    ),
    GetPage(
      name: _Paths.CREATE_PRODUK,
      page: () => CreateProdukView(),
      binding: CreateProdukBinding(),
    ),
    GetPage(
      name: _Paths.PRODUK_DATA,
      page: () => ProdukDataView(),
      binding: ProdukDataBinding(),
    ),
    GetPage(
      name: _Paths.DETAIL_PRODUK,
      page: () => DetailProductView(),
      binding: DetailProdukBinding(),
    ),
  ];
}
