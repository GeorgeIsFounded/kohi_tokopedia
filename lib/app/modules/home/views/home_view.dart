import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:get/get.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';
import 'package:tokopedia/app/controllers/auth_controller_controller.dart';
import 'package:tokopedia/app/controllers/produk_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/currencyConverter.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authController = Get.put(AuthControllerController());
  final produkC = Get.put(ProdukController());
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(15),
                  height: tinggi * 0.12,
                  width: lebar,
                  decoration: BoxDecoration(color: bgLogin),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50,
                        width: 300,
                        child: TextField(
                          decoration: InputDecoration(
                              fillColor: Colors.white,
                              filled: true,
                              hintText: "Cari rtx 4090",
                              prefixIcon: Icon(Icons.search_outlined),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                      Container(
                        width: 150,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.mail_outline_outlined,
                                color: Colors.white,
                                size: 27,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.notifications_none_outlined,
                                color: Colors.white,
                                size: 27,
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.shopping_cart_outlined,
                                color: Colors.white,
                                size: 27,
                              ),
                            ),
                            InkWell(
                              onTap: () => authController.logOut(),
                              child: Icon(
                                Icons.menu,
                                color: Colors.white,
                                size: 27,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
            Container(
                margin: EdgeInsets.symmetric(vertical: 20),
                height: 130,
                child: CarouselSlider(
                  options: CarouselOptions(
                      height: 400.0,
                      autoPlay: true,
                      autoPlayInterval: Duration(seconds: 3)),
                  items: [
                    "../../../../../assets/belanja.png",
                    "../../../../../assets/kebut.png",
                    "../../../../../assets/prochiz.png"
                  ].map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                            width: lebar,
                            margin: EdgeInsets.symmetric(horizontal: 15),
                            child: Container(
                              child: Image.asset(i),
                            ));
                      },
                    );
                  }).toList(),
                )),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 16,
                runSpacing: 10,
                children: [
                  CustomMenu(
                      icon: '../../../../../assets/menu/promo.png',
                      text: "Promo Hari Ini"),
                  CustomMenu(
                      icon: '../../../../../assets/menu/toserba.png',
                      text: "Toserba"),
                  CustomMenu(
                      icon: '../../../../../assets/menu/elektronik.png',
                      text: "Elektronik"),
                  CustomMenu(
                      icon: '../../../../../assets/menu/tagihan.png',
                      text: "Top-up & Tagihan"),
                  CustomMenu(
                      icon: '../../../../../assets/menu/lihat.png',
                      text: "Lihat Semua"),
                  CustomMenu(
                      icon: '../../../../../assets/menu/official.png',
                      text: "Official Store"),
                  CustomMenu(
                      icon: '../../../../../assets/menu/live.png',
                      text: "Live Shopping"),
                  CustomMenu(
                      icon: '../../../../../assets/menu/seru.png',
                      text: "Tokopedia Seru"),
                  CustomMenu(
                      icon: '../../../../../assets/menu/cod.png',
                      text: "Bayar di Tempat"),
                  CustomMenu(
                      icon: '../../../../../assets/menu/balong.png',
                      text: "Bangga Lokal")
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 7),
                    child: Row(
                      children: [
                        Text(
                          "Kejar Diskon Spesial",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          children: [
                            Container(
                              child: Text(
                                "Berakhir dalam",
                                style: TextStyle(color: Colors.grey),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 25,
                              width: lebar * 0.22,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: Colors.red.shade700),
                              child: Container(
                                padding: EdgeInsets.only(left: 5, right: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Icon(
                                      Icons.access_time,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      "00 : 15 : 12",
                                      style: TextStyle(
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        child: Text(
                          "Lihat Semua",
                          style: TextStyle(
                              color: lihatSemua, fontWeight: FontWeight.w600),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, bottom: 30),
              height: tinggi * 0.39,
              width: lebar,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.topRight,
                      colors: [bgSponsor1, bgSponsor2])),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    Container(
                      child: Image.asset("../../../../../assets/poster.png"),
                    ),
                    FutureBuilder<QuerySnapshot<Object?>>(
                        future: produkC.getProdukData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            var listData = snapshot.data!.docs;
                            print("========================");
                            print(listData);
                            print("========================");
                            return Wrap(
                              spacing: 0,
                              alignment: WrapAlignment.spaceBetween,
                              runSpacing: 10,
                              children: List.generate(
                                  listData.length,
                                  (index) => KejarDiskonCard(
                                      data: listData[index].data()
                                          as Map<String, dynamic>,
                                      page: Routes.DETAIL_PRODUK,
                                      arguments: listData[index])),
                            );
                          } else {
                            return (Center(
                              child: CircularProgressIndicator(),
                            ));
                          }
                        }),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Pilihan Promo Hari ini",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Lihat Semua",
                      style: TextStyle(
                          color: lihatSemua, fontWeight: FontWeight.w600),
                    ),
                  )
                ],
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.fromLTRB(17, 10, 30, 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image.asset("../../../../../assets/poster1.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image.asset("../../../../../assets/poster2.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image.asset("../../../../../assets/poster3.png"),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Image.asset("../../../../../assets/poster1.png"),
                      ),
                    ]),
              ),
            ),
            Container(
              width: lebar,
              height: tinggi * 0.01,
              color: Colors.grey.shade300,
            ),
            Container(
              margin: EdgeInsets.only(top: 20),
              padding: EdgeInsets.symmetric(horizontal: 27),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Produk Pilihan Untukmu",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                    ),
                  ),
                  Container(
                    child: Text(
                      "Lihat Semua",
                      style: TextStyle(
                          color: lihatSemua, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    produkPilihan(lebar, tinggi),
                    produkPilihan(lebar, tinggi),
                    produkPilihan(lebar, tinggi),
                    produkPilihan(lebar, tinggi)
                  ],
                ),
              ),
            ),
            Container(
              width: lebar,
              height: tinggi * 0.01,
              color: Colors.grey.shade300,
            ),
            Container(
              height: tinggi * 2.35,
              width: lebar,
              margin: EdgeInsets.only(top: 35, left: 15, right: 15),
              child: Column(
                children: [
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(right: 10),
                          padding: EdgeInsets.all(10),
                          height: 63,
                          width: 120,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              gradient: LinearGradient(
                                  begin: Alignment.bottomLeft,
                                  end: Alignment.topRight,
                                  colors: [smallitem, smallitem2])),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(bottom: 5),
                                    height: 3,
                                    width: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "For rizqi",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(10),
                            height: 63,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [smallitem4, smallitem3])),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child: Text(
                                    "Spesial Discount",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(10),
                            height: 63,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [smallitem5, smallitem6])),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 25),
                                  child: Text(
                                    "Aktivitasmu",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                        Container(
                            padding: EdgeInsets.all(10),
                            height: 63,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                gradient: LinearGradient(
                                    begin: Alignment.bottomLeft,
                                    end: Alignment.topRight,
                                    colors: [smallitem8, smallitem7])),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 40),
                                  child: Text(
                                    "Favorit",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(25, 10, 25, 0),
                    width: double.infinity,
                    child: FutureBuilder<QuerySnapshot<Object?>>(
                        future: produkC.getProdukData(),
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.done) {
                            var listData = snapshot.data!.docs;
                            print("========================");
                            print(listData);
                            print("========================");
                            return Wrap(
                              spacing: 0,
                              alignment: WrapAlignment.spaceBetween,
                              runSpacing: 20,
                              // children: List.generate(listData.length, (index) => Text((listData[index].data() as Map<String, dynamic>)['namaProduk'])),
                              children: List.generate(
                                  listData.length,
                                  (index) => ProdukData(
                                      data: listData[index].data()
                                          as Map<String, dynamic>)),
                            );
                          } else {
                            return (Center(
                              child: CircularProgressIndicator(),
                            ));
                          }
                        }),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(25, 0, 25, 20),
              height: tinggi * 0.07,
              width: lebar,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      child: Text(
                    "Lihat Selebihnya",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}

Widget CustomMenu({icon, text, widht}) {
  return InkWell(
    onTap: () {},
    child: Container(
      height: 100,
      width: 79,
      child: Column(
        children: [
          Container(
            width: widht,
            height: 50,
            child: Image.asset(icon),
          ),
          Text(
            text,
            textAlign: TextAlign.center,
          )
        ],
      ),
    ),
  );
}

Widget produk(lebar, tinggi) {
  return Container(
    margin: EdgeInsets.fromLTRB(30, 10, 0, 10),
    height: tinggi * 0.44,
    width: 170,
    decoration: BoxDecoration(
        color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Container(
          height: tinggi * 0.2,
          width: lebar,
          decoration: BoxDecoration(),
          child: Image.asset(
            "../../../../../assets/masker.png",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Rp 1.000",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding:
                          EdgeInsets.only(left: 5, right: 5, top: 2, bottom: 2),
                      child: Text(
                        "92%",
                        style: TextStyle(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      decoration: BoxDecoration(color: diskon),
                    ),
                    Container(
                      child: Text(
                        "Rp 12.546",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            decoration: TextDecoration.lineThrough),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7),
                child: Row(
                  children: [
                    Container(
                      height: 15,
                      width: 15,
                      child: Image.asset(
                          "../../../../../assets/menu/official.png"),
                    ),
                    Container(
                      child: Text(
                        "Kab. Tangerang",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 13),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 80,
                  size: 5,
                  padding: 0,
                  selectedColor: Colors.red.shade600,
                  unselectedColor: Color(0xffeeeeee),
                  roundedEdges: Radius.circular(2),
                ),
              ),
              Row(
                children: [
                  Container(
                    child: Text(
                      "Segera Habis",
                      style:
                          TextStyle(color: Colors.grey.shade600, fontSize: 13),
                    ),
                  ),
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget produkPilihan(lebar, tinggi) {
  return Container(
    margin: EdgeInsets.fromLTRB(21, 10, 5, 10),
    height: tinggi * 0.45,
    width: 170,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(3, 4))
    ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Container(
          height: tinggi * 0.2,
          width: lebar,
          decoration: BoxDecoration(),
          child: Image.asset(
            "../../../../../assets/mouse.png",
            fit: BoxFit.fill,
          ),
        ),
        Container(
          padding: EdgeInsets.all(7),
          child: Column(
            children: [
              Container(
                child: Text(
                  "Logitech G603 Lightspeed ...",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Rp 609.000",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      padding:
                          EdgeInsets.only(left: 8, right: 8, top: 3, bottom: 3),
                      child: Text(
                        "44%",
                        style: TextStyle(
                            color: Colors.red.shade700,
                            fontWeight: FontWeight.bold,
                            fontSize: 10),
                      ),
                      decoration: BoxDecoration(color: diskon),
                    ),
                    Container(
                      child: Text(
                        "Rp 1.090.000",
                        style: TextStyle(
                            color: Colors.grey.shade600,
                            decoration: TextDecoration.lineThrough),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 7),
                child: Row(
                  children: [
                    Container(
                      height: 20,
                      width: 20,
                      child: Image.asset("../../../../../assets/badge.png"),
                    ),
                    Container(
                      child: Text(
                        "Kab. Tangerang",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 15),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: StepProgressIndicator(
                  totalSteps: 100,
                  currentStep: 80,
                  size: 5,
                  padding: 0,
                  selectedColor: Colors.red.shade600,
                  unselectedColor: Color(0xffeeeeee),
                  roundedEdges: Radius.circular(2),
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Colors.yellow.shade700,
                    size: 20,
                  ),
                  Text(
                    "4.8",
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 10),
                    height: 13,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Text(
                    "Terjual 312",
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w100),
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}

Widget KejarDiskonCard({data, page, arguments}) {
  String truncate(String text, {length = 7, omission = '...'}) {
    if (length >= text.length) {
      return text;
    }
    return text.replaceRange(length, text.length, omission);
  }

  int diskon = data['hargaDiskon'];
  int harga = data['hargaProduk'];

  double convertDiskon() {
    double disk = diskon * (harga / 100);
    double hargaFix = harga - disk;
    return hargaFix;
  }

  return Container(
    margin: EdgeInsets.only(right: 15),
    width: 146,
    height: 310,
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: Colors.white),
    child: InkWell(
      onTap: () => Get.toNamed(page, arguments: arguments),
      child: Column(
        children: [
          Container(
            width: 146,
            height: 146,
            child: Image.network(data['gambarProduk']),
          ),
          Container(
            width: 200,
            padding: EdgeInsets.fromLTRB(2, 12, 2, 12),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(truncate(data['namaProduk'], length: 22),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    CurrencyFormat.convertToIdr(convertDiskon(), 0),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6, top: 6),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        width: 36,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(2),
                            color: Colors.red.shade200),
                        child: Center(
                          child: Text(
                            '${data['hargaDiskon'].toString()}%',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.red),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          CurrencyFormat.convertToIdr(data['hargaProduk'], 0),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey.shade400),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          data['kotaProduk'],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade400),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: StepProgressIndicator(
                    totalSteps: 100,
                    currentStep: 80,
                    size: 4,
                    padding: 0,
                    selectedColor: Colors.red,
                    unselectedColor: Color(0xffeeeeee),
                    roundedEdges: Radius.circular(2),
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text('Segera Habis',
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey.shade400)),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget ProdukData({
  data,
  double lebar = 175,
  double tinggi = 345,
  double lebarGambar = 175,
  double tinggiGambar = 175,
}) {
  String truncate(String text, {length = 7, omission = '...'}) {
    if (length >= text.length) {
      return text;
    }
    return text.replaceRange(length, text.length, omission);
  }

  int diskon = data['hargaDiskon'];
  int harga = data['hargaProduk'];

  double convertDiskon() {
    double disk = diskon * (harga / 100);
    double hargaFix = harga - disk;
    return hargaFix;
  }

  final produkC = Get.put(ProdukController());

  return InkWell(
    child: Container(
      // padding: EdgeInsets.symmetric(vertical: 10),
      width: lebar,
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 5,
          blurRadius: 7,
          offset: Offset(0, 0), // changes position of shadow
        ),
      ], borderRadius: BorderRadius.circular(8), color: Colors.white),
      child: Column(
        children: [
          Container(
            width: lebarGambar,
            height: tinggiGambar,
            child: Image.network(data['gambarProduk']),
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(10, 12, 10, 12),
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(bottom: 10),
                  alignment: Alignment.centerLeft,
                  child: Text(truncate(data['namaProduk'], length: 30),
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.w400)),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    CurrencyFormat.convertToIdr(convertDiskon(), 0),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6, top: 6),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 6),
                        width: 36,
                        height: 20,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadiusDirectional.circular(2),
                            color: Colors.red.shade100),
                        child: Center(
                          child: Text(
                            '${data['hargaDiskon'].toString()}%',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: Colors.red.shade500),
                          ),
                        ),
                      ),
                      Container(
                        child: Text(
                          CurrencyFormat.convertToIdr(data['hargaProduk'], 0),
                          style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                              decoration: TextDecoration.lineThrough,
                              color: Colors.grey.shade500),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 16),
                  child: Row(
                    children: [
                      Container(
                        child: Text(
                          data['kotaProduk'],
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade500),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Container(
                          margin: EdgeInsets.only(right: 4),
                          child: Icon(
                            CupertinoIcons.star_fill,
                            color: Color(0xffffc400),
                            size: 13,
                          )),
                      Container(
                        child: Text(
                            '${data['rating'].toString()} | Terjual ${data['terjual'].toString()}',
                            style: TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500)),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
