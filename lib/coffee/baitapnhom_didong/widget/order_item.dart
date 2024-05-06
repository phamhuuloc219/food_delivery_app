import 'package:flutter/material.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/model/drink.dart';

class OrderItem {
  final String tenSanPham;
  final Drink drink;
  final int quantity; // Thêm thuộc tính quantity
  final String imageUrl;

  OrderItem({
    required this.tenSanPham,
    required this.drink,
    required this.quantity,
    required this.imageUrl,
  });
}
