import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/detail/widget/drink_detail.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/detail/widget/drink_img.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/model/drink.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/appcolor.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/custom_appbar.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/order_page.dart';

class PageDetail extends StatelessWidget {
  final Drink drink;
  List<OrderItem> selectedItems = []; // Danh sách các sản phẩm được chọn

  PageDetail(this.drink);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kPrimaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Thanh Tab bar ở đầu trang giới thiệu
            CustomAppbar(
              Icons.arrow_back, // Icon bên phía bên trái
              Icons.shopping_cart_outlined,
              leftCallback: () => Navigator.of(context).pop(), // Quay lại trang chủ khi bấm Icon 'back'
              rightCallback: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderPage(selectedItems),)), // Đi tới giỏ hàng khi bấm Icon 'shopping_cart'
            ),
            DrinkImg(drink),
            DrinkDetail(drink),
          ],
        ),
      ),
    );
  }
}
