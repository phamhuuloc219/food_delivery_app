import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/model/coffee.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/appcolor.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/coffee_info.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/drink_carousel.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/drink_list.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/drink_listview.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/order_page.dart';
import 'package:food_delivery_app/components/my_drawer.dart';

class PageMainBBL extends StatefulWidget {
  const PageMainBBL({Key? key}) : super(key: key);

  @override
  State<PageMainBBL> createState() => _PageMainBBLState();
}

class _PageMainBBLState extends State<PageMainBBL> {
  var selected = 0;
  final pageController = PageController();
  final coffee = Coffee.generateCoffee();
  List<OrderItem> selectedItems = []; // Danh sách các sản phẩm được chọn

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coffee Tứ Hoàng"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      drawer: MyDrawer(),
      backgroundColor: AppColors.kBackground,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40,),
          // CustomAppbar(
          //   Icons.settings,
          //   Icons.search_outlined,
          // ),
          DrinkCarousel(),
          CoffeeInfo(),
          ListDrink(
            selected,
                (int index) {
              setState(() {
                selected = index;
              });
              pageController.jumpToPage(index);
            },
            coffee,
          ),
          Expanded(
            child: DrinkListView(
              selected,
                  (int index) {
                setState(() {
                  selected = index;
                });
              },
              pageController,
              coffee,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton( // nút giỏ hàng ở cuối
        onPressed: () async {
          final result = await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => OrderPage(selectedItems),
            ),
          );

          if (result != null) {
            // Xử lý kết quả đặt hàng ở đây (nếu cần)
          }
        },
        backgroundColor: AppColors.kPrimaryColor,
        elevation: 2,
        child: Icon(
          Icons.shopping_bag_outlined,
          color: Colors.black,
          size: 35,
        ),
      ),
    );
  }

  // void updateSelectedItems(String productName, int quantity) {
  //   setState(() {
  //     selectedItems.add(
  //       OrderItem(
  //         tenSanPham: productName,
  //         quantity: quantity,
  //         imageUrl: coffee.logoUrl,
  //       ),
  //     );
  //   });
  // }
}
