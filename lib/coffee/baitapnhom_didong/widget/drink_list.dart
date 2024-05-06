import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/model/coffee.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/appcolor.dart';

class ListDrink extends StatelessWidget {
  final int selected;
  final Function callback;
  final Coffee coffee;
  ListDrink(this.selected, this.callback, this.coffee);
  @override
  Widget build(BuildContext context) {
    final category = coffee.menu.keys.toList();
    return Container(
      height: 105,
      padding: EdgeInsets.symmetric(vertical:35,),
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) =>
          GestureDetector(
            onTap: () => callback(index),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: selected == index ? AppColors.kPrimaryColor : Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  category[index],
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        separatorBuilder: (context, index) => SizedBox(width: 20,),
        itemCount: category.length,
      ),
    );
  }
}
