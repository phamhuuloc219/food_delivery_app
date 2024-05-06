import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/detail/gioithieu.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/model/coffee.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/drink_item.dart';

class DrinkListView extends StatelessWidget {
  final int selected;
  final Function callback;
  final PageController pageController;
  final Coffee coffee;
  DrinkListView(this.selected, this.callback, this.pageController, this.coffee);

  @override
  Widget build(BuildContext context) {
    final category = coffee.menu.keys.toList();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: PageView(
        controller: pageController,
        onPageChanged: (index) => callback(index),
        children:
          category.map((e) =>
            ListView.separated(
              padding: EdgeInsets.zero,
              itemBuilder: (context, index) => GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => PageDetail(coffee.menu[category[selected]]![index]),)
                  );
                },
                child: DrinkItem(
                    coffee.menu[category[selected]]![index]),
              ),
              separatorBuilder: (context, index) => SizedBox(height: 15,),
              itemCount: coffee.menu[category[selected]]!.length)).toList(),

      ),
    );
  }
}
