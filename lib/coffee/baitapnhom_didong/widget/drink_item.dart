import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/model/drink.dart';

class DrinkItem extends StatelessWidget {
  final Drink drink;
  DrinkItem(this.drink, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(5),
            width: 100,
            height: 100,
            child: Image.asset(drink.imgUrl, fit: BoxFit.fitHeight,),
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(top: 20, left: 5, right: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(drink.name,
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(Icons.arrow_forward_ios_outlined, size: 20,),
                    ],
                  ),
                  SizedBox(height: 10,),
                  Text(drink.desc,
                    style: TextStyle( fontSize: 20),
                  ),
                  SizedBox(height: 10,),
                  Text('${drink.price}đ',
                    style: TextStyle( fontSize: 15),
                  )
                ],
              ),
            ),
          )
        ],
      ),

    );
  }
}
