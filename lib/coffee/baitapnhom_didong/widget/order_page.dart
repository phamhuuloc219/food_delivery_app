import 'package:flutter/material.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/appcolor.dart';
import 'package:food_delivery_app/coffee/baitapnhom_didong/widget/custom_appbar.dart';

class OrderItem {
  final String tenSanPham; // Thay đổi tên thuộc tính thành tenSanPham
  final String imageUrl;
  int quantity;

  OrderItem({
    required this.tenSanPham, // Sửa tên thuộc tính thành tenSanPham
    required this.imageUrl,
    required this.quantity,
  });
}

class OrderPage extends StatefulWidget {
  final List<OrderItem> orderItems;
  OrderPage(this.orderItems);

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  void _increaseQuantity(int index) {
    setState(() {
      widget.orderItems[index].quantity++;
    });
  } //phương thức sử dụng để tăng số lượng

  void _decreaseQuantity(int index) {
    if (widget.orderItems[index].quantity > 1) {
      setState(() {
        widget.orderItems[index].quantity--;
      });
    }
  } //phương thức sử dụng giảm

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: CustomAppbar(
          Icons.arrow_back_ios_outlined,
          Icons.add_circle_outline,
          leftCallback: () => Navigator.of(context).pop(),
        ),
      ),
      body: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Container(
          color: AppColors.yellowColor,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Đơn hàng của bạn',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 26),
                  itemCount: widget.orderItems.length,
                  itemBuilder: (context, index) {
                    final orderItem = widget.orderItems[index];

                    return Column(
                      children: [
                        Container(
                          color: Colors.white,
                          padding: EdgeInsets.all(16),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                child: CircleAvatar(
                                  radius: 80,
                                  backgroundImage: AssetImage(orderItem.imageUrl),
                                ),
                              ),
                              SizedBox(width: 6),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      orderItem.tenSanPham,
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 5),
                                    Row(
                                      children: [
                                        IconButton(
                                          icon: Icon(Icons.remove),
                                          onPressed: () {
                                            _decreaseQuantity(index);
                                          },
                                        ),
                                        SizedBox(width: 10),
                                        Text(
                                          '${orderItem.quantity}',
                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                        SizedBox(width: 10),
                                        IconButton(
                                          icon: Icon(Icons.add),
                                          onPressed: () {
                                            _increaseQuantity(index);
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 20),
                      ],
                    );
                  },
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Xác nhận đặt hàng'),
                        content: Text('Bạn có chắc chắn muốn đặt hàng?'),
                        actions: [
                          TextButton(
                            onPressed: () {
                              // Xử lý đặt hàng ở đây
                              // Sau khi xử lý xong, bạn có thể đóng hộp thoại và thực hiện các hành động khác
                              Navigator.of(context).pop();
                            },
                            child: Text('Đồng ý'),
                          ),
                          TextButton(
                            onPressed: () {
                              // Hủy đặt hàng
                              // ...
                              Navigator.of(context).pop();
                            },
                            child: Text('Hủy'),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text('Đặt hàng'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
