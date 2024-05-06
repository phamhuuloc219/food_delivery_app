import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/food.dart';

class FoodTitle extends StatelessWidget {
  final Food food;
  final void Function()? onTap;
  const FoodTitle({super.key, required this.food, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              children: [

                // text food detail
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(food.name),
                        Text("\$"+food.price.toString(),style: TextStyle(color: Theme.of(context).colorScheme.primary),),
                        SizedBox(height: 10,),
                        Text(food.description,style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                      ],
                    )
                ),
                SizedBox(width: 15,),

                // food image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                    child: Image.asset(food.imagePath, height: 100, width: 100,),
                ),
              ],
            ),
          ),
        ),

        // Divider line
        Divider(
          color: Theme.of(context).colorScheme.tertiary,
          endIndent: 25,
          indent: 25,
        ),
      ],
    );
  }
}
