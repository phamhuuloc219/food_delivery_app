import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/detail/widget/drink_quantity.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/model/drink.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/appcolor.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/order_page.dart';

class DrinkDetail extends StatelessWidget {
  final Drink drink;
  DrinkDetail(this.drink);

  @override
  Widget build(BuildContext context) {
    return Container(
      //height: 500,

      padding: EdgeInsets.all(25),
      color: AppColors.kBackground,
      child: Column(
        children: [
          // Tên Nước Uống
          Text(
            drink.name,
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 15,), // Khoảng cách
          // Thông tin thời gian, đánh giá...
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildIconText( //thời gian
                  Icons.access_time_outlined,
                  Colors.blue,
                  drink.waitTime
              ),
              _buildIconText(// điểm đánh giá
                Icons.star_outline,
                Colors.amber,
                drink.score.toString(),
              ),
              _buildIconText(//Calo
                Icons.local_fire_department_outlined,
                Colors.redAccent,
                drink.cal,
              ),
            ],
          ),
          SizedBox(height: 30,),
          DrinkQuantity(drink),
          SizedBox(height: 30,),
          Row(
            children: [
              Text(
                'Thông tin',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Text(
            drink.about,
            style: TextStyle(
              fontSize: 20,
              wordSpacing: 1.2,
              height: 1.5,
            ),
          ),
          SizedBox(height: 10,),
          Row( // 2 nut
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton( // nut mua hang
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      int quantity = 1; // Số lượng sản phẩm mặc định là 1
                      return AlertDialog(
                        title: Text('Mua Hàng', style: TextStyle(fontSize: 20)), // Thong bao o dau
                        content: StatefulBuilder(
                          builder: (context, setState) {
                            return Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row( //phần
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                      icon: Icon(Icons.remove, size: 20),
                                      onPressed: () {
                                        if (quantity > 1) {
                                          setState(() {
                                            quantity--;
                                          });
                                        }
                                      },
                                    ),
                                    Text(
                                      quantity.toString(),
                                      style: TextStyle(fontSize: 20),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        setState(() {
                                          quantity++;
                                        });
                                      },
                                      icon: Icon(Icons.add, size: 20),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 20),
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => OrderPage([
                                          OrderItem(tenSanPham: drink.name, quantity: quantity, imageUrl: drink.imgUrl),
                                          // Thêm các OrderItem khác vào đây (nếu có)
                                        ]),
                                      ),
                                    );
                                  },
                                  child: Text('Thanh toán'),
                                ),
                              ],
                            );
                          },
                        ),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Hủy'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Mua Hàng', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              ),
              ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút "Thêm vào giỏ hàng"
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Thông báo'),
                        content: Text('Sản phẩm đã được thêm vào giỏ hàng!'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('OK'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Thêm vào giỏ hàng', style: TextStyle(fontWeight: FontWeight.bold),),
              ),
            ],
          )

        ],
      ),
    );
  }

  Widget _buildIconText(IconData icon, Color color, String text) {
    return Row(
      children: [
        Icon(icon, color: color, size: 25,),
        SizedBox(width: 5,),
        Text(text, style: TextStyle(fontSize: 20))
      ],
    );
  }
}
