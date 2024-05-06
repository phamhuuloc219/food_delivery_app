
import 'package:get/get.dart';

class Drink {
  String imgUrl;
  String desc;
  String name;
  String waitTime;
  num score;
  String cal;
  num price;
  num quantity;
  String about;

  Drink(this.imgUrl, this.desc, this.name, this.waitTime, this.score, this.cal,
      this.price, this.quantity, this.about,); // thuộc tính
  static List<Drink> generateRecommendFoods(){
    return [
      Drink(
        'assets/images/img.png',
        'Ngon nhứt quán',
        'Bánh pizza phà kè',
        ' min',
        9.8,
        '325 kcal',
        29000,
        1,
        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
      ),
      Drink(
        'assets/images/capuchino.jpg',
        'Ngon nhứt quán',
        'Cappucino',
        '15 min',
        8.8,
        '325 kcal',
        25000,
        0,
        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
      ),
      Drink(
        'assets/images/americano.jpg',
        'Thức uống được các bạn trẻ yêu mến',
        'Americano',
        '15 min',
        9.8,
        '325 kcal',
        20000,
        1,
        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
      ),
      Drink(
        'assets/images/machiato.jpg',
        'Em ngon như là machiato',
        'Machiato',
        '18 min',
        9.8,
        '400 kcal',
        25000,
        1,
        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
      ),
      Drink(
        'assets/images/bacxiu.jpg',
        'Thức uống của kẻ nặng tình',
        'Bạc Xỉu',
        '10 min',
        9.8,
        '325 kcal',
        20000,
        1,
        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
      ),
      Drink(
        'assets/images/tramangcau.png',
        'Sản phẩm Đú trend hiện tại',
        'Trà Mãng Cầu',
        '15 min',
        10.0,
        '335 kcal',
        35000,
        1,
        'Loại sản phẩm mới nhất thị trường, đang là một trong những mẫu hàng được ưu chuộng nhất hiện này',
      ),
    ];
  }

  static List<Drink> generateRecommendDrinks(){
    return [
      Drink(
          'assets/images/img.png',
          'Ngon nhứt quán',
          'Cà Phê Muối',
          '15 min',
          9.8,
          '325 kcal',
          29000,
          1,
          'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
        ),
      Drink(
        'assets/images/capuchino.jpg',
        'Ngon nhứt quán',
        'Cappucino',
        '15 min',
        8.8,
        '325 kcal',
        25000,
        0,
        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
      ),
      Drink(
        'assets/images/americano.jpg',
        'Thức uống được các bạn trẻ yêu mến',
        'Americano',
        '15 min',
        9.8,
        '325 kcal',
        20000,
        1,
        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
      ),
      Drink(
        'assets/images/machiato.jpg',
        'Em ngon như là machiato',
        'Machiato',
        '18 min',
        9.8,
        '400 kcal',
        25000,
        1,
        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
      ),
      Drink(
        'assets/images/bacxiu.jpg',
        'Thức uống của kẻ nặng tình',
        'Bạc Xỉu',
        '10 min',
        9.8,
        '325 kcal',
        20000,
        1,
        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
      ),
      Drink(
        'assets/images/tramangcau.jpg',
        'Sản phẩm Đú trend hiện tại',
        'Trà Mãng Cầu',
        '15 min',
        10.0,
        '335 kcal',
        35000,
        1,
        'Loại sản phẩm mới nhất thị trường, đang là một trong những mẫu hàng được ưu chuộng nhất hiện này',
      ),
    ];
  }
  static List<Drink> generatePopularDrinks(){
    return [
      Drink(
        'assets/images/img.png',
        'Ngon nhứt quán',
        'Cà Phê Muối',
        '15 min',
        9.8,
        '325 kcal',
        12,
        1,

        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',

      ),
      Drink(
        'assets/images/img.png',
        'Ngon nhứt quán',
        'Cappucino',
        '15 min',
        9.8,
        '325 kcal',
        12,
        1,

        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',

      ),
      Drink(
        'assets/images/img.png',
        'Americano',
        'Cà Phê Muối',
        '15 min',
        9.8,
        '325 kcal',
        12,
        1,

        'Loại thức uống ngon nhất của quán, đang là loại nước hot nhất trong các loại cà phê',
      )
    ];
  }
}
