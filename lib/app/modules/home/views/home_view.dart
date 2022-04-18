import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final con = Get.find<HomeController>();
  final qcon = TextEditingController();
  getDictionaryFormWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Spacer(),
          Text(
            "Dictionary App",
            style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Search any word you want quickly",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 32,
          ),
          TextField(
            controller: qcon,
            decoration: InputDecoration(
              hintText: "Search a word",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(4),
                borderSide: BorderSide(color: Colors.transparent),
              ),
              fillColor: Colors.grey[100],
              filled: true,
              prefixIcon: Icon(Icons.search),
              hintStyle: TextStyle(color: Colors.white),
            ),
          ),
          Spacer(),
          Container(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                con.searchaword(qcon.text);
              },
              style: ElevatedButton.styleFrom(
                  primary: Colors.deepOrangeAccent,
                  padding: const EdgeInsets.all(16)),
              child: Text("SEARCH"),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
          appBar: AppBar(
            title: Text('HomeView'),
            centerTitle: true,
          ),
          backgroundColor:
              !con.iserror.value ? Colors.blueGrey[900] : Colors.white,
          body: con.isloading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : con.iserror.value
                  ? Center(
                      child: Column(
                        children: [
                          TextButton(
                              onPressed: () {
                                con.setright();
                              },
                              child: Text('go back')),
                          Text('something went wrong'),
                        ],
                      ),
                    )
                  : getDictionaryFormWidget(context)),
    );
  }
}
