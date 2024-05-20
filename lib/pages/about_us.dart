import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'About Us',
          style: TextStyle(
            color: Theme.of(context).colorScheme.inversePrimary,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Chào mừng đến với ứng dụng giao đồ ăn của nhà hàng RASCHJRS thực hiện bởi nhóm Lộc - Thảo!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Ứng dụng giao đồ ăn nhanh của nhóm Lộc - Thảo ra đời với mục tiêu mang đến cho khách hàng những trải nghiệm ẩm thực tuyệt vời và tiện lợi nhất. Chúng tôi cam kết cung cấp dịch vụ giao đồ ăn nhanh chóng, an toàn và chất lượng, giúp khách hàng tiết kiệm thời gian và tận hưởng những bữa ăn ngon ngay tại nhà.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Lợi ích khi sử dụng ứng dụng: \n - Tiết kiệm thời gian: Chỉ cần vài thao tác trên ứng dụng, bạn có thể đặt món ăn yêu thích mà không cần ra ngoài.\n- Chất lượng đảm bảo: Món ăn được chế biến từ nguyên liệu tươi ngon, được chọn lọc kỹ càng từ nhà cung cấp uy tín.\n- Ưu đãi hấp dẫn: Ứng dụng thường xuyên có các chương trình khuyến mãi, giảm giá dành cho khách hàng thân thiết.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Chúng tôi luôn lắng nghe và giải quyết mọi phản hồi từ khách hàng, không ngừng cải thiện chất lượng dịch vụ.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const SizedBox(height: 50),
                Text(
                  "Enjoy cái Moment này thôi nào!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.inversePrimary,
                  ),
                ),
                const Text(
                  " Copyright© by PHL",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}