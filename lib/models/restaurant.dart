import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:food_delivery_app/models/food.dart';
import 'package:intl/intl.dart';

class Restaurant extends ChangeNotifier{

  // list of food menu
  final List<Food> _menu=[
    // burgers
    Food(
        name: "Chicken Burger",
        description: "Thơm ngon mời bạn ăn nha",
        imagePath: "lib/images/burgers/burger_ga.jpg",
        price: 7.99,
        category: FoodCategory.burgers,
        availableAddons: [
          Addon(name: "Extra chicken", price: 0.99),
          Addon(name: "Extra chicken & cheese", price: 1.49),
          Addon(name: "Extra gold bars", price: 1.99),
        ],
    ),

    Food(
      name: "Beef Burger",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/burgers/burger_bo.jpg",
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra beef", price: 0.99),
        Addon(name: "Extra smoked beef", price: 1.49),
        Addon(name: "Extra gold bars", price: 1.99),
      ],
    ),

    Food(
      name: "Shrimp Burger",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/burgers/burger_tom.jpg",
      price: 6.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra shrimp", price: 0.99),
        Addon(name: "Extra shrimp big size", price: 1.49),
        Addon(name: "Extra lobster", price: 1.99),
      ],
    ),

    Food(
      name: "Fish Burger",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/burgers/burger_ca.jpg",
      price: 6.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra fish", price: 0.99),
        Addon(name: "Bacon", price: 1.49),
        Addon(name: "Avocado", price: 1.99),
      ],
    ),

    Food(
      name: "Classic Cheese Burger",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/burgers/smashed_cheeseburger.jpg",
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(name: "Extra Cheese", price: 0.99),
        Addon(name: "Bacon", price: 1.49),
        Addon(name: "Avocado", price: 1.99),
      ],
    ),

    // salads
    Food(
      name: "Asian Sesame Salad",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/salads/asiansesame_salad.jpg",
      price: 6.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Mandarin Oranges", price: 0.99),
        Addon(name: "Almond Slivers", price: 1.49),
        Addon(name: "Extra Teriyaki Chicken", price: 1.99),
      ],
    ),

    Food(
      name: "Ceasar Salad",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/salads/ceasar_salad.jpg",
      price: 7.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Grilled Chicken", price: 0.99),
        Addon(name: "Anchovies", price: 1.49),
        Addon(name: "Extra Parmesan", price: 1.99),
      ],
    ),

    Food(
      name: "Quinoa Salad",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/salads/quinoa_salad.jpg",
      price: 9.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Avocado", price: 0.99),
        Addon(name: "Feta Cheese", price: 1.49),
        Addon(name: "Grilled Chicken", price: 1.99),
      ],
    ),

    Food(
      name: "Greek Salad",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/salads/greek_salad.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Feta Cheese", price: 0.99),
        Addon(name: "Kalamata Olives", price: 1.49),
        Addon(name: "Grilled Shrimp", price: 1.99),
      ],
    ),

    Food(
      name: "South West Salad",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/salads/southwest_salad.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(name: "Sour Cream", price: 0.99),
        Addon(name: "Pico de Gallo", price: 1.49),
        Addon(name: "Guacamole", price: 1.99),
      ],
    ),

    // sides
    Food(
      name: "Sweet Potato Fries",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/sides/sweet_potato_side.jpg",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Cheese Sauce", price: 0.99),
        Addon(name: "Truffle Oil", price: 1.49),
        Addon(name: "Cajun Spice", price: 1.99),
      ],
    ),

    Food(
      name: "Orion Rings",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/sides/onion_rings_side.jpg",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Ranch Dip", price: 0.99),
        Addon(name: "Spicy Mayo", price: 1.49),
        Addon(name: "Parmeson Dust", price: 1.99),
      ],
    ),

    Food(
      name: "Garlic Bread",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/sides/garlic_bread_side.jpg",
      price: 3.49,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Extra Garlic", price: 0.99),
        Addon(name: "Mozzarella Cheese", price: 1.49),
        Addon(name: "Marinara Dip", price: 1.99),
      ],
    ),

    Food(
      name: "Loaded Sweet Potato Fries",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/sides/loadedfries_side.jpg",
      price: 4.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Sour Cream", price: 0.99),
        Addon(name: "Bacon Bits", price: 1.49),
        Addon(name: "Green Onions", price: 0.99),
      ],
    ),

    Food(
      name: "Crispy Mac & Cheese Bites",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/sides/mac_side.jpg",
      price: 3.99,
      category: FoodCategory.sides,
      availableAddons: [
        Addon(name: "Bacon Bits", price: 0.99),
        Addon(name: "Jalapeno Slices", price: 1.49),
        Addon(name: "Scriracha Drizzle", price: 0.99),
      ],
    ),

    // desserts
    Food(
      name: "Banana Parfait",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/desserts/banana_parfait.jpg",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra 3 cakes", price: 0.99),
        Addon(name: "Extra 6 cakes", price: 1.49),
        Addon(name: "Extra 9 cakes", price: 1.99),
      ],
    ),

    Food(
      name: "Cherry Delight Dessert",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/desserts/cherry_delight_dessert.jpg",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra 3 cakes", price: 0.99),
        Addon(name: "Extra 6 cakes", price: 1.49),
        Addon(name: "Extra 9 cakes", price: 1.99),
      ],
    ),

    Food(
      name: "ChocoPie",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/desserts/choco_bye.jpg",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra 3 cakes", price: 0.99),
        Addon(name: "Extra 6 cakes", price: 1.49),
        Addon(name: "Extra 9 cakes", price: 1.99),
      ],
    ),

    Food(
      name: "Chocolate Dessert",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/desserts/chocolate_dessert.jpg",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra 3 cakes", price: 0.99),
        Addon(name: "Extra 6 cakes", price: 1.49),
        Addon(name: "Extra 9 cakes", price: 1.99),
      ],
    ),

    Food(
      name: "Strawberry Cake",
      description: "Thơm ngon mời bạn ăn nha",
      imagePath: "lib/images/desserts/strawberry_short_cake.jpg",
      price: 2.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Extra 3 cakes", price: 0.99),
        Addon(name: "Extra 6 cakes", price: 1.49),
        Addon(name: "Extra 9 cakes", price: 1.99),
      ],
    ),

    // drinks
    Food(
      name: "Cà phê muối",
      description: "Thơm ngon nức mũi",
      imagePath: "lib/images/drinks/coffee_muoi.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Thêm lớp kem trứng", price: 0.99),
        Addon(name: "Thêm cốt dừa", price: 0.49),
        Addon(name: "Thêm kem trứng & cốt dừa", price: 1.19),
      ],
    ),

    Food(
      name: "Matcha đá xay",
      description: "Thơm ngon mời bạn uống nha",
      imagePath: "lib/images/drinks/matcha_da_xay.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Thêm lớp kem trứng", price: 0.99),
        Addon(name: "Thêm thạch", price: 0.49),
        Addon(name: "Thêm kem trứng & thạch", price: 1.19),
      ],
    ),

    Food(
      name: "Sữa tươi trân châu đường đen",
      description: "Thơm ngon mời bạn uống nha",
      imagePath: "lib/images/drinks/sttcdd.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Thêm trân châu", price: 0.49),
        Addon(name: "Thêm thạch", price: 0.49),
        Addon(name: "Thêm trân châu & thạch", price: 0.99),
      ],
    ),

    Food(
      name: "Trà sữa khoai môn",
      description: "Thơm ngon mời bạn uống nha",
      imagePath: "lib/images/drinks/ts_khoai_mon.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Thêm trân châu", price: 0.49),
        Addon(name: "Thêm thạch", price: 0.49),
        Addon(name: "Thêm trân châu & thạch", price: 0.99),
      ],
    ),

    Food(
      name: "Yogurt Việt Quất",
      description: "Thơm ngon mời bạn uống nha",
      imagePath: "lib/images/drinks/yogurt_viet_quat.jpg",
      price: 1.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Thêm việt quất", price: 0.99),
        Addon(name: "Thêm sữa chua", price: 0.49),
        Addon(name: "Upsize", price: 1.19),
      ],
    ),

  ];

  // user cart
  final List<CartItem> _cart = [];
  // delivery address
  String _deliveryAddress ="2 Nguyễn Đình Chiểu";

  /*
  GETTERS
  */
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  /*
  OPERATIONS
  */

  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons){
    // see if there is a cart already with the same food and selected adddons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if the food item are the same
      bool isSameFood = item.food == food;
      //check if the list of selected addons are the same
      bool isSameAddons = ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });
    // if item already exists, increase it's quantity
    if(cartItem != null){
      cartItem.quantity++;
    }
    // otherwise, add a new cart item to the cart
    else{
      _cart.add(
          CartItem(
              food: food,
              selectedAddons: selectedAddons
          )
      );
    }
    notifyListeners();
  }

  //remove form cart
  void removeFromCart(CartItem cartItem){
    int cartIndex = _cart.indexOf(cartItem);
    if(cartIndex != -1){
      if(_cart[cartIndex].quantity>1){
        _cart[cartIndex].quantity--;
      } else{
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

  // get total price of cart
  double getTotalPrice(){
    double total = 0.0;

    for(CartItem cartItem in _cart){
      double itemTotal = cartItem.food.price;
      for(Addon addon in cartItem.selectedAddons){
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  // get total number of items in cart
  int getTotalItemCount(){
    int totalItemCount = 0;
    for(CartItem cartItem in _cart){
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }
  // clear cart
  void clearCart(){
    _cart.clear();
    notifyListeners();
  }

  //update delivery address
  void updateDeliveryAddress(String newAddress){
    _deliveryAddress = newAddress;
    notifyListeners();
  }


  /*
  HELPERS
  */

  // generate a receipt
  String displayCartReceipt(){
    final receipt = StringBuffer();
    receipt.write("Here's your receipt.");
    receipt.writeln();

    // format the date to include up to seconds only
    String formattedDate = DateFormat("yyyy-MM-dd HH:mm:ss").format(DateTime.now());
    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("-------------");

    for(final cartItem in _cart){
      receipt.writeln("${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty){
        receipt.writeln("   Add-ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }

    receipt.writeln("-------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  // format double value into money
  String _formatPrice(double price){
    return "\$${price.toStringAsFixed(2)}";
  }

  // format list of addons into a string sumary
  String _formatAddons(List<Addon> addons){
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}