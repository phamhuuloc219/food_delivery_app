import 'package:flutter/material.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/page_main.dart';
import 'package:food_delivery_app/coffee/profile/page_catalog.dart';
class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Home"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _buildButton(context, title: "Đến Trang Data",
                  destination:
                  PageCaralog()),
              _buildButton(context, title: "Đến Trang Nhóm",
                  destination:
                  PageMainBBL()),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildButton(BuildContext context, {required
  String title, required Widget destination }) {
    return ElevatedButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => destination)
          );
        }
        ,
        child: Text("$title"));
  }
}