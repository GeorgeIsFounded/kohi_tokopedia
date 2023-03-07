import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

class SliderController extends GetxController {
  //TODO: Implement SliderController

  String url = '';
  File? path;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  
  addData(String imageSlider, String descSlider, bool activeSlider) async {
    CollectionReference slider = firestore.collection("slider");
    final sliderData = {
      "activeSlider": activeSlider,
      "descSlider": descSlider,
      "imageSlider": imageSlider
    };
    try {
      await slider.add(sliderData).then((DocumentReference doc) =>
          Get.defaultDialog(title: "Success", middleText: "Adding data"));
      Get.toNamed(Routes.SLIDER_DATA);
    } catch (e) {
      Get.defaultDialog(title: "Alert", middleText: "Failure adding data");
    }
  }

  Future<QuerySnapshot<Object?>> getData() async {
    CollectionReference slider = firestore.collection("slider");

    return await slider.get();
  }

  updateData(String id, bool activeSlider, String descSlider,
      String imageSlider) async {
    DocumentReference Slider = firestore.collection("slider").doc(id);

    try {
      final sliderData = {
        "activeSlider": activeSlider,
        "descSlider": descSlider,
        "imageSlider": imageSlider
      };
      await Slider.update(sliderData);
      Get.defaultDialog(title: "Success", middleText: "updating data");
    } catch (e) {
      Get.defaultDialog(title: "Failure", middleText: "data couldn't updated");
      print(e);
    }
  }

  deleteData(String id) async {
    try {
      DocumentReference Slider = firestore.collection("slider").doc(id);
      await Slider.delete();
      Get.defaultDialog(title: "Success", middleText: "deleted data");
    } catch (e) {
      Get.defaultDialog(
          title: "Failure", middleText: "data couldn't be deleted");
      print(e);
    }
  }

  addPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      String namaFile = result.files.first.name;
      url = namaFile;

      // try {
      await storage.ref("${namaFile}").putFile(file);
      final data = await storage.ref("${namaFile}").getDownloadURL();
      url = data;

      print("Success ======================================");
      print(url);

      return url;
      // } catch (e) {
      //   print("gagal upload ==============================================");
      // }
    } else {
      print("tidak mengirim filename ===================================");
    }
  }
}
