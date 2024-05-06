import 'package:food_delivery_app/coffee/baitapnhom_didong/model/drink.dart';

class Coffee {
  String name;
  String waitTime;
  String distance;
  String label;
  String logoUrl;
  String desc;
  num score;
  Map<String, List<Drink>> menu;

  Coffee(this.name, this.waitTime, this.distance, this.label, this.logoUrl,
      this.desc, this.score, this.menu); // thuộc tính
  static Coffee generateCoffee(){
    return Coffee(
        'Cà phê Tứ Hoàng',
        '20-30 min',
        '1km',
        'Đã uống là phải đã',
        'assets/images/logocf.jpg',
        'Tứ Hoàng Coffee Xin Chào',
        9.0,
        {
          'Đề xuất': Drink.generateRecommendDrinks(),
          'Phổ biến': Drink.generatePopularDrinks(),
          'Thức ăn thêm': Drink.generateRecommendFoods() ,
          'Ngoài lề': []
        },
    );
}
}