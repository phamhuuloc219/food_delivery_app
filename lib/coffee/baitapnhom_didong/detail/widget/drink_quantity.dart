import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/model/drink.dart';

class DrinkQuantity extends StatelessWidget {
  final Drink drink;

  DrinkQuantity(this.drink);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      height: 40,
      child: Center(
        child: Text('${drink.price.toString()} Đ',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),),
      )
    );
  }
}
