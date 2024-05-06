import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/coffee/profile/controller_mathang.dart';
import 'package:food_delivery_app/coffee/profile/page_cart.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class PageCaralog extends StatelessWidget {
  PageCaralog({Key? key}) : super(key: key);
  var c = Get.put(ControllerCatalog());
  final controller = Get.put(ControllerCatalog());
  final bool showBadge = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Catalog"),
        actions: [
          Obx(() => Padding(
            padding: const EdgeInsets.only(top: 12, right: 12),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PageCart624(),),
                );
              },
              child: badges.Badge(
                showBadge: c.soLuongMH_GioHang > 0, //dieu kien de hien thi badge
                badgeContent: Text("${c.soLuongMH_GioHang}"), //widget de hien thi so luong mat hang
                child: Icon(Icons.shopping_cart_outlined, size: 35,), //bieu tuong gio hang

              ),
            ),
          ),
          )
        ],
      ),

      body: GetX<ControllerCatalog>(
        init: c,
        builder: (controller) {
          var listMH = controller.listMH;
          return ListView.builder(
            itemCount: listMH.length,
            itemBuilder: (context, index) => Container(
              color: index % 2 == 0 ? Colors.blue[50] : Colors.white,
              child: ListTile(
                leading: Text("${index + 1}"),
                title: Text(listMH[index].tenMH),
                subtitle: Text("${listMH[index].gia} vnd"),
                trailing: controller.kiemTraMT_CoTrongGH(index) == true ? Icon(Icons.check) : IconButton(
                    onPressed: () {
                      controller.themVaoGioHang(index);
                    },
                    icon: Icon(Icons.add)),
              ),
            ),
          );
        },
      ),
    );
  }
}