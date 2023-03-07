import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

class AuthControllerController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  Stream<User?> streamAuthStatus() => auth.authStateChanges();
  String verificationCode = "";

  login(String emailAddress, String password) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      Get.offAllNamed(Routes.HOME);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
            title: "perhatian", middleText: "user tidak di temukan");
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
            title: "perhatian",
            middleText: "password salah silahkan isi dengan benar!");
      }
    }
  }

  logOut() {
    Get.defaultDialog(
        title: "yakin Log Out?",
        middleText: "anda berhasil Log Out",
        confirm: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade700),
          onPressed: () async {
            await FirebaseAuth.instance.signOut();
            Get.offAndToNamed(Routes.SPLASH_SCREEN);
            print("berhasil Log Out");
          },
          child: Text("yes"),
        ),
        cancel: ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red.shade600),
          onPressed: () => Get.back(),
          child: Text("No"),
        ));
  }

  signUp(String emailAddress, String password) async {
    try {
      final credential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      credential.user?.sendEmailVerification();
      Get.offAllNamed(Routes.CHECK_EMAIL);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
            title: "perhatian",
            middleText:
                "email anda sudah di pakai silahkan isi dengan email yg lain");
      }
    } catch (e) {
      print(e);
    }
  }

  resetPassword(String email) async {
    try {
      await auth.sendPasswordResetEmail(email: email);
      Get.toNamed(Routes.CHECK_EMAIL);
    } on FirebaseAuthException catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'Failure Reset password');
    }
  }

  // Future<UserCredential> signInWithGoogle() async {
  //   // Trigger the authentication flow
  //   final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  //   // Obtain the auth details from the request
  //   final GoogleSignInAuthentication? googleAuth =
  //       await googleUser?.authentication;

  //   // Create a new credential
  //   final credential = GoogleAuthProvider.credential(
  //     accessToken: googleAuth?.accessToken,
  //     idToken: googleAuth?.idToken,
  //   );

  //   // Once signed in, return the UserCredential
  //   return await FirebaseAuth.instance.signInWithCredential(credential);
  // }

  Future<UserCredential> signInWithGoogle() async {
    // Create a new provider
    GoogleAuthProvider googleProvider = GoogleAuthProvider();

    googleProvider
        .addScope('https://www.googleapis.com/auth/contacts.readonly');
    googleProvider.setCustomParameters({'login_hint': 'user@example.com'});

    // Once signed in, return the UserCredential
    return await FirebaseAuth.instance.signInWithPopup(googleProvider);

    // Or use signInWithRedirect
    // return await FirebaseAuth.instance.signInWithRedirect(googleProvider);
  }

  Future<UserCredential> signInWithFacebook() async {
    // Trigger the sign-in flow
    final LoginResult loginResult = await FacebookAuth.instance.login();

    // Create a credential from the access token
    final OAuthCredential facebookAuthCredential =
        FacebookAuthProvider.credential(loginResult.accessToken!.token);

    // Once signed in, return the UserCredential
    return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  }

  verifyPhone(String phoneNumber) async {
    await auth.verifyPhoneNumber(
        phoneNumber: '+62${phoneNumber}',
        verificationCompleted: (PhoneAuthCredential credential) async {
          await auth.signInWithCredential(credential).then((value) => {
                if (value.user != null) {Get.toNamed(Routes.HOME)}
              });
        },
        verificationFailed: (FirebaseAuthException e) {
          Get.defaultDialog(
              title: 'Alert', middleText: 'Fail sending verification message');
        },
        codeSent: (String verificationId, int? resendToken) {
          verificationCode = verificationId;
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          verificationCode = verificationId;
        },
        timeout: Duration(seconds: 60));
    Get.toNamed(Routes.OTP_VERIFICATION, parameters: {"phone": phoneNumber});
  }

  checkOtp(String sms) async {
    try {
      await auth
          .signInWithCredential(PhoneAuthProvider.credential(
              verificationId: verificationCode, smsCode: sms))
          .then((value) => {
                if (value.user != null) {Get.toNamed(Routes.HOME)}
              });
    } catch (e) {
      Get.defaultDialog(title: 'Alert~', middleText: 'Wrong verification code');
    }
  }
}
