import 'package:flutter/cupertino.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/model/drink.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/appcolor.dart';

class DrinkImg extends StatelessWidget {
  final Drink drink;

  DrinkImg(this.drink);

  @override
  Widget build(BuildContext context) {
    return Container(
      //tạo khối chứa widget con, chiều cao 250
      height: 250,
      child: Stack(
        children: [
          Column(
            children: [
              Expanded( // tạo khoảng trống giữa phần trên và phần dưới
                flex: 1,
                child: Container(
                ),
              ),
              Expanded( //phần dưới của khối, nơi chứa thông tin
                flex: 1,
                child: Container(
                  decoration: BoxDecoration(
                    // Bo công phần trên bên trái và bên phải
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: AppColors.kBackground,
                  ),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              child: Image.asset(drink.imgUrl, fit: BoxFit.cover,),
            ),
          )
        ],
      ),
    );
  }
}
