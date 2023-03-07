import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';

import '../controllers/create_produk_controller.dart';

class CreateProdukView extends GetView<CreateProdukController> {
  final controller = Get.put(CreateProdukController());
  final produkC = Get.put(ProdukController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  width: lebar,
                  height: 60,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: [
                            Colors.pink.shade400,
                            Colors.pink.shade200,
                            Colors.pink.shade300
                          ]),
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(5),
                          bottomRight: Radius.circular(5))),
                  child: Center(
                    child: Text(
                      "✨ Create Slider ✨",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                  child: Column(
                    children: [
                      Container(),
                      Container(
                        padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                        margin: EdgeInsets.only(bottom: 40),
                        child: InkWell(
                          onTap: () => controller.uploadGambar(),
                          child: Container(
                            width: 200,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(6),
                                color: Colors.blue.shade400),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text(
                                  'Upload Gambar',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      CustomInput(
                          controller: controller.namaProduk,
                          label: 'Nama Produk',
                          hint: 'Masukkan Nama Produk',
                          obscure: false),
                      CustomInput(
                          controller: controller.deskripsi,
                          label: 'Deskripsi Produk',
                          hint: 'Masukkan Deskripsi Produk',
                          obscure: false),
                      CustomInput(
                          controller: controller.hargaProduk,
                          label: 'Harga Produk',
                          hint: 'Masukkan Harga Produk',
                          obscure: false),
                      CustomInput(
                          controller: controller.beratProduk,
                          label: 'Berat Produk',
                          hint: 'Masukkan Berat Produk',
                          obscure: false),
                      CustomInput(
                          controller: controller.kotaProduk,
                          label: 'Tempat Produk',
                          hint: 'Masukkan Tempat Produk',
                          obscure: false),
                      CustomInput(
                          controller: controller.etalase,
                          label: 'Etalase Produk',
                          hint: 'Masukkan Etalase Produk',
                          obscure: false),
                      CustomInput(
                          controller: controller.namaToko,
                          label: 'Nama Toko',
                          hint: 'Masukkan Nama Toko',
                          obscure: false),
                    ],
                  )),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                margin: EdgeInsets.only(top: 40),
                child: InkWell(
                  onTap: () {
                    produkC.addProdukData(
                        controller.beratProduk.text,
                        controller.namaToko.text,
                        controller.deskripsi.text,
                        int.parse('50'),
                        controller.etalase.text,
                        controller.gambarProduk.text,
                        int.parse(controller.hargaProduk.text),
                        controller.namaProduk.text,
                        controller.namaToko.text,
                        int.parse("4"),
                        int.parse("200"),
                        int.parse("500"));
                  },
                  child: Container(
                    width: lebar,
                    height: 55,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6),
                        color: Colors.blue.shade300),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Buat Produk',
                          style: TextStyle(
                              fontSize: 16,
                              color: Colors.white,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}

Widget CustomInput({label, controller, obscure, hint, icon}) {
  return Column(
    children: [
      Container(
        margin: EdgeInsets.only(bottom: 5),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ),
      ),
      Container(
        margin: EdgeInsets.only(bottom: 20),
        child: TextFormField(
            controller: controller,
            obscureText: obscure,
            decoration: InputDecoration(
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                color: Colors.black,
                fontSize: 19,
              ),
              hintText: hint,
              hintStyle: TextStyle(
                  fontFamily: "Poppins",
                  color: Colors.grey.shade400,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 18,
              ),
              suffixIcon: icon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: BorderSide(color: Colors.grey.shade400, width: 1),
                gapPadding: 5,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(6),
                borderSide: const BorderSide(
                    color: Color.fromARGB(255, 27, 27, 27), width: 1),
                gapPadding: 5,
              ),
            )),
      ),
    ],
  );
}
