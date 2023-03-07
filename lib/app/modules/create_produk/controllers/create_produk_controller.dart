import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';

class CreateProdukController extends GetxController {
  //TODO: Implement CreateProdukController

  TextEditingController beratProduk = TextEditingController();
  TextEditingController kotaProduk = TextEditingController();
  TextEditingController deskripsi = TextEditingController();
  TextEditingController gambarProduk = TextEditingController();
  TextEditingController hargaProduk = TextEditingController();
  TextEditingController namaProduk = TextEditingController();
  TextEditingController namaToko = TextEditingController();
  TextEditingController etalase = TextEditingController();

  uploadGambar() async {
    String data = await ProdukController().addProdukPhoto();
    gambarProduk.text = data;
    // gambar = true;
    print(data);
  }

  final count = 0.obs;
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
