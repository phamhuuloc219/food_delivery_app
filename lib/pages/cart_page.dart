import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_button.dart';
import 'package:food_delivery_app/components/my_cart_title.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/payment_page.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        //cart
        final userCart = restaurant.cart;

        //scaffold UI

        return Scaffold(
          appBar: AppBar(
            title: const Text('Cart'),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            foregroundColor: Theme.of(context).colorScheme.inversePrimary,
            actions: [
              //clear cart button
              IconButton(
                onPressed: () {
                  if(userCart.isEmpty){
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Warning'),
                        content: SingleChildScrollView(
                          child: ListBody(
                            children: [
                              Text('Cart is empty'),
                            ],
                          ),
                        ),
                        actions: [
                          //cancel
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Close',style:TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                          ),
                        ],
                      ),
                    );
                  }
                  else{
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text(
                            'Are you sure, you want to clear the cart?',
                            style: TextStyle(
                              fontSize: 20,
                            ),
                          ),
                          actions: [
                            //cancel button
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text(
                                'Cancel',
                                style: TextStyle(
                                  color: Colors.green,
                                ),
                              ),
                            ),
                            //Yes button
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                                restaurant.clearCart();
                              },
                              child: const Text(
                                'Yes',
                                style: TextStyle(
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    );
                  }

                },
                icon: const Icon(Icons.delete),
              ),
            ],
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //List of cart
              Expanded(
                child: Column(
                  children: [
                    userCart.isEmpty
                        ? Expanded(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.shopping_cart,
                              size: 35,
                              color: Theme.of(context)
                                  .colorScheme
                                  .inversePrimary,
                            ),
                            const SizedBox(height: 10),
                            Text(
                              'Cart is empty..',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context)
                                      .colorScheme
                                      .inversePrimary),
                            ),
                          ],
                        ),
                      ),
                    )
                        : Expanded(
                      child: ListView.builder(
                        itemCount: userCart.length,
                        itemBuilder: (context, index) {
                          //get individual cart item
                          final cartItem = userCart[index];

                          //return carttile UI
                          return MyCartTitle(cartItem: cartItem);
                        },
                      ),
                    ),
                  ],
                ),
              ),
              //Button to pay
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: MyButton(
                    ontap: () {
                      if(userCart.isEmpty){
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Warning'),
                            content: SingleChildScrollView(
                              child: ListBody(
                                children: [
                                  Text('Cart is empty'),
                                ],
                              ),
                            ),
                            actions: [
                              //cancel
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text('Close',style:TextStyle(color: Theme.of(context).colorScheme.inversePrimary),),
                              ),
                            ],
                          ),
                        );
                      }
                      else{
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PaymentPage(),
                          ),
                        );
                      }
                    },
                    text: 'Checkout'),
              ),

              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }
}