// ignore_for_file: unused_import, non_constant_identifier_names, unnecessary_string_interpolations, unnecessary_brace_in_string_interps

import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:tokopedia/app/modules/home/views/home_view.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

class ProdukController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseStorage storage = FirebaseStorage.instance;
  String url = "";
  File? path;

  Future<QuerySnapshot<Object?>> getProdukData() async {
    CollectionReference produk = firestore.collection('produk');

    return await produk.get();
  }

  addProdukData(
      String beratProduk,
      String kotaProduk,
      String deskripsi,
      int hargaDiskon,
      String etalase,
      String gambarProduk,
      int hargaProduk,
      String namaProduk,
      String namaToko,
      int rating,
      int terjual,
      int totalProdukRating) async {
    CollectionReference produk = firestore.collection('produk');

    final produkData = {
      "beratProduk": beratProduk,
      "kotaProduk": kotaProduk,
      "deskripsi": deskripsi,
      "hargaDiskon": hargaDiskon,
      "etalase": etalase,
      "gambarProduk": gambarProduk,
      "hargaProduk": hargaProduk,
      "namaProduk": namaProduk,
      "namaToko": namaToko,
      "rating": rating,
      "terjual": terjual,
      "totalProdukRating": totalProdukRating,
    };

    // Add a new document with a generated ID
    try {
      await produk.add(produkData).then((DocumentReference doc) {
        Get.defaultDialog(title: 'Alert', middleText: 'berhasil menambah data');
        // Get.offNamed(Routes.SLIDER_DATA);
      });
      Get.toNamed(Routes.PRODUK_DATA);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal menambah data');
    }
  }

  updateProdukData(
      String id,
      int beratProduk,
      String kotaProduk,
      String deskripsi,
      int hargaDiskon,
      String etalase,
      String gambarProduk,
      int hargaProduk,
      String namaProduk,
      String namaToko,
      int rating,
      int terjual,
      int totalProdukRating) async {
    try {
      final produkData = {
        "beratProduk": beratProduk,
        "kotaProduk": kotaProduk,
        "deskripsi": deskripsi,
        "hargaDiskon": hargaDiskon,
        "etalase": etalase,
        "gambarProduk": gambarProduk,
        "hargaProduk": hargaProduk,
        "namaProduk": namaProduk,
        "namaToko": namaToko,
        "rating": rating,
        "terjual": terjual,
        "totalProdukRating": totalProdukRating,
      };

      DocumentReference Produk = firestore.collection('produk').doc(id);
      await Produk.update(produkData);

      Get.defaultDialog(title: 'Alert', middleText: 'berhasil menupdate data');
      // Get.offNamed(Routes.SLIDER_DATA);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal menupdate data');
    }
  }

  deleteProdukData(String id) async {
    try {
      DocumentReference Produk = firestore.collection('produk').doc(id);
      await Produk.delete();
      Get.defaultDialog(title: 'Alert', middleText: 'berhasil mendelete data');
      // return Get.offAllNamed(Routes.SLIDER_DATA);
    } catch (e) {
      Get.defaultDialog(title: 'Alert', middleText: 'gagal mendelete data');
    }
  }

  addProdukPhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      File file = File(result.files.single.path!);
      String namaFile = result.files.first.name;
      url = namaFile;
      path = file;

      try {
        await storage.ref("${namaFile}").putFile(file);
        final data = await storage.ref("${namaFile}").getDownloadURL();

        url = data;

        return url;
      } catch (e) {
        Get.defaultDialog(title: 'Alert', middleText: 'gagal menUpload file');
      }
    } else {}
  }

  filterData() async {
    final result = await firestore
        .collection("produk")
        // .where('harga', isEqualTo: 699000)
        .orderBy('hargaProduk', descending: true)
        .limit(10)
        .get();
    print(result.docs.length);
    print("*******************************");

    if (result.docs.length > 0) {
      result.docs.forEach((element) {
        print(element.data());
      });
    } else {
      print('tidak ada data');
    }
  }
}
