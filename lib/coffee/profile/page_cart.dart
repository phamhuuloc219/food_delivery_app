import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';

import 'controller_mathang.dart';

class PageCart624 extends StatelessWidget {
  const PageCart624({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cart"),
      ),
      body: GetX<ControllerCatalog>(
        init: Get.find<ControllerCatalog>(),
        builder: (controller) {
          var gioHang = controller.gioHang;
          var matHang = controller.listMH;

          return Column(
            children: [
              Expanded(
                  child: ListView.builder(
                    itemCount: gioHang.length,
                    itemBuilder: (context, index) => Row(
                      children: [
                        Text("${index+1}. ${matHang[gioHang[index]].tenMH}"),
                        Text("${index+1}. ${matHang[gioHang[index]].gia}"),
                        IconButton(
                          onPressed:() {
                            controller.xoaRaKhoiGioHang(index);
                          },
                          icon: Icon(Icons.delete_forever),
                        )
                      ],
                    ),
                  )
              ),
              Container(
                height: 50,
              )
            ],
          );
        },
      ),
    );
  }
}