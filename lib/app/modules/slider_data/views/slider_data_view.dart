import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tokopedia/app/controllers/slider_controller.dart';
import 'package:tokopedia/app/routes/app_pages.dart';

import '../controllers/slider_data_controller.dart';

class SliderDataView extends GetView<SliderDataController> {
  final sliderC = Get.put(SliderController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<QuerySnapshot<Object?>>(
            future: sliderC.getData(),
            builder: (context, Snapshot) {
              if (Snapshot.connectionState == ConnectionState.done) {
                var listData = Snapshot.data!.docs;
                return ListView.builder(
                  itemCount: listData.length,
                  itemBuilder: (context, index) => ListTile(
                    onTap: () {
                      Get.toNamed(Routes.UPDATE_SLIDER);
                    },
                    onLongPress: () => sliderC.deleteData(listData[index].id),
                    title: Text((listData[index].data()
                        as Map<String, dynamic>)["descSlider"]),
                    subtitle: Text((listData[index].data()
                            as Map<String, dynamic>)["activeSlider"]
                        .toString()),
                    leading: Container(
                      width: 70,
                      child: Image.network(
                        (listData[index].data()
                            as Map<String, dynamic>)["imageSlider"],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              } else {
                return Center(
                  child: CircularProgressIndicator(),
                );
              }
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.CREATE_SLIDER);
          },
          child: Icon(Icons.add),
        ));
  }
}
