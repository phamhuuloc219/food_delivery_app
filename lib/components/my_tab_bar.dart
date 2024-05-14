import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class MyTabBar extends StatelessWidget {
  final TabController tabController;
  const MyTabBar({super.key, required this.tabController});

  List<Tab> _buildCategoryTabs(){
    return FoodCategory.values.map((category) {
      String categoryName = category.toString().split('.').last;
      categoryName = categoryName.substring(0, 1).toUpperCase() +
          categoryName.substring(1);
      return Tab(
        text: categoryName,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
          controller: tabController,
          tabs: _buildCategoryTabs(),
      ),
    );
  }
}
