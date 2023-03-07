import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/routes/app_pages.dart';
import 'package:tokopedia/config/warna.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  @override
  Widget build(BuildContext context) {
    double tinggi = MediaQuery.of(context).size.height;
    double lebar = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
          child: Container(
        height: tinggi,
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(10, 20, 20, 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.HOME); 
                      },
                      child: Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Icon(Icons.arrow_back_rounded),
                      ),
                    ),
                    Container(
                      height: 46,
                      width: 300,
                      child: TextField(
                        decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Cari perfume mahal",
                            prefixIcon: Icon(Icons.search_outlined),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(7))),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.share_outlined,
                              color: Colors.black,
                              size: 27,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.black,
                              size: 27,
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.menu_rounded,
                              color: Colors.black,
                              size: 27,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: lebar,
                child: Image.asset(
                  "../../../../../assets/perfume.png",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  children: [
                    Container(
                      width: lebar * 0.9,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            child: Text(
                              "Rp370.000",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 27),
                            ),
                          ),
                          Container(
                            child: Icon(
                              Icons.heart_broken_outlined,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          width: lebar * 0.8,
                          child: Text(
                            "Mine. Perfumery ETHEREAL - 50ml Eau De Parfum",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.w100),
                          ),
                        ),
                      ],
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 20),
                      width: lebar * 1,
                      padding: EdgeInsets.symmetric(horizontal: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              child: Text('Terjual 250+'),
                            ),
                            Container(
                              width: lebar * 0.25,
                              height: 35,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade300)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.yellow.shade700,
                                    size: 18,
                                  ),
                                  Text(
                                    '4.9 (320)',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: lebar * 0.35,
                              height: 35,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade400)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Foto Pembeli (50)',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: lebar * 0.25,
                              height: 35,
                              margin: EdgeInsets.only(right: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade400)),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    'Diskusi (25)',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              jarak(context),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(bottom: 30),
                          child: Text("Detail Produk",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 20)),
                        )
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300))),
                          margin: EdgeInsets.only(top: 10),
                          width: lebar * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Berat Satuan",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.only(right: 185, bottom: 10),
                                  child: Text(
                                    "200g",
                                    style: TextStyle(fontSize: 17),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom:
                                      BorderSide(color: Colors.grey.shade300))),
                          margin: EdgeInsets.only(top: 10),
                          width: lebar * 0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 10),
                                child: Text(
                                  "Etalase",
                                  style: TextStyle(
                                      color: Colors.grey.shade500,
                                      fontSize: 17),
                                ),
                              ),
                              Container(
                                  margin:
                                      EdgeInsets.only(right: 50, bottom: 10),
                                  child: Text(
                                    "Mine Private Collection",
                                    style: TextStyle(
                                        fontSize: 17, color: lihatSemua),
                                  )),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(bottom: 30, top: 20),
                              child: Text("Deskripsi Produk",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20)),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              width: lebar * 0.8,
                              child: Text(
                                "Mine. ETHEREAL Eau De Parfum 50mi glass perfume bottle in hard box packaging • ETHEREAL • With facets that highlight a side ...",
                                style: TextStyle(fontSize: 16),
                              ),
                            )
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: 20),
                              width: lebar * 0.8,
                              child: Text(
                                "Baca Selengkapnya",
                                style:
                                    TextStyle(fontSize: 16, color: lihatSemua),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                color: Colors.grey.shade400,
                height: 1,
                width: lebar,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.asset('../../../../../assets/pp.png'),
                        SizedBox(
                          width: lebar * 0.015,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Image.asset(
                                    '../../../../../assets/menu/official.png',
                                    width: 18),
                                Text(
                                  ' Mine. Parfumery',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16),
                                )
                              ],
                            ),
                            SizedBox(
                              height: tinggi * 0.01,
                            ),
                            RichText(
                              text: TextSpan(children: [
                                TextSpan(
                                  text: 'Online',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                TextSpan(
                                  text: ' 23 Jam lalu',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.grey.shade600),
                                ),
                              ]),
                            ),
                            SizedBox(
                              height: tinggi * 0.006,
                            ),
                            Text('Kota Tangerang'),
                          ],
                        ),
                      ],
                    ),
                    Container(
                      width: lebar * 0.2,
                      height: 37,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(width: 1, color: lihatSemua)),
                      child: Text(
                        'Follow',
                        style: TextStyle(
                            color: lihatSemua,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              jarak(context),
              Container(
                margin: EdgeInsets.only(top: 5),
                width: lebar * 0.9,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Produk Pilihan Untukmu",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 22),
                      ),
                    ),
                    Container(
                      child: Text(
                        "Lainnya di toko ini",
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
                      lainnya(lebar, tinggi),
                      lainnya(lebar, tinggi),
                      lainnya(lebar, tinggi),
                      lainnya(lebar, tinggi)
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

Widget jarak(context) {
  double tinggi = MediaQuery.of(context).size.height;
  double lebar = MediaQuery.of(context).size.width;
  return Container(
    margin: EdgeInsets.only(top: 15, bottom: 15),
    width: lebar,
    height: tinggi * 0.01,
    color: Colors.grey.shade300,
  );
}

Widget lainnya(lebar, tinggi) {
  return Container(
    margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
    height: tinggi * 0.43,
    width: 170,
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(color: Colors.grey, blurRadius: 3, offset: Offset(3, 4))
    ], color: Colors.white, borderRadius: BorderRadius.circular(10)),
    child: Column(
      children: [
        Container(
            height: tinggi * 0.24,
            width: lebar,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                image: DecorationImage(
                    image: AssetImage("../../../../../assets/perfume2.png"),
                    fit: BoxFit.fill))),
        Container(
          padding: EdgeInsets.all(7),
          child: Column(
            children: [
              Container(
                child: Text(
                  "SteelSeries Rival 3 Wireless - Gaming ...",
                  style: TextStyle(fontSize: 17),
                ),
              ),
              Row(
                children: [
                  Text(
                    "Rp 699.000",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                        "Cashback",
                        style: TextStyle(
                            color: Colors.green, fontWeight: FontWeight.bold),
                      ),
                      decoration: BoxDecoration(color: Colors.green.shade100),
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
                        "Jakarta Pusat",
                        style: TextStyle(
                            color: Colors.grey.shade600, fontSize: 15),
                      ),
                    ),
                  ],
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
                    "5.0",
                    style: TextStyle(fontWeight: FontWeight.w100),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 5, right: 10),
                    height: 13,
                    width: 1,
                    color: Colors.grey,
                  ),
                  Text(
                    "Terjual 124",
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
