import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxdictioaryapp/app/modules/home/controllers/home_controller.dart';

import '../controllers/detail_controller.dart';

class DetailView extends GetView<DetailController> {
  final i = Get.arguments['i'];
  final p = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DetailView'),
          centerTitle: true,
        ),
        body: Column(
          children: [Text(p.lw[i].word!)],
        ));
  }
}
