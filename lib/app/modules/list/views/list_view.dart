import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:getxdictioaryapp/app/modules/home/controllers/home_controller.dart';
import 'package:getxdictioaryapp/app/routes/app_pages.dart';

import '../controllers/list_controller.dart';

class ListViews extends GetView<ListController> {
  final con = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    print(con.lw);
    return Scaffold(
        appBar: AppBar(
          title: Text('ListView'),
          centerTitle: true,
        ),
        body: ListView.separated(
            itemBuilder: (ctx, index) => InkWell(
                  onTap: () {
                    Get.toNamed(Routes.DETAIL, arguments: {'i': index});
                  },
                  child: ListTile(
                    title: Text('${index + 1} ${con.lw[index].word!}'),
                  ),
                ),
            separatorBuilder: (ctx, index) => Divider(
                  color: Colors.grey,
                ),
            itemCount: con.lw.length));
  }
}
