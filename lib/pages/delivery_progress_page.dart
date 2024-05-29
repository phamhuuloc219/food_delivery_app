import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_receipt.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/home_page.dart';
import 'package:food_delivery_app/services/database/firestore.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class DeliveryProgressPage extends StatefulWidget {
  const DeliveryProgressPage({super.key});

  @override
  State<DeliveryProgressPage> createState() => _DeliveryProgressPageState();
}

class _DeliveryProgressPageState extends State<DeliveryProgressPage> {

  // get acces to db
  FirestoreService db = FirestoreService();

  void infoDriver() {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Info Driver'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Name: Phạm Hữu Lộc'),
                Text('Phone number: 0376282119'),
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

  @override
  void initState() {
    super.initState();
    // if we get to this page, submid order to firestore db
    String receipt = context.read<Restaurant>().displayCartReceipt();
    db.saveOrderToDatabase(receipt);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: (){
                // clear cart
                context.read<Restaurant>().clearCart();
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              icon: Icon(Icons.arrow_back, color: Theme.of(context).colorScheme.inversePrimary,)
          ),
          Spacer(),
          IconButton(
              onPressed: (){
                // clear cart
                context.read<Restaurant>().clearCart();
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(),
                  ),
                );
              },
              icon: Icon(Icons.home, color: Theme.of(context).colorScheme.inversePrimary,)
          ),
        ],

      ),
      bottomNavigationBar: _buildBottomNavBar(context),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MyReceipt(),
            const SizedBox(height: 10),
            LottieBuilder.network(
              'https://lottie.host/ce96b661-1556-4147-8ec3-b56290210cbb/1J4ypWs3i8.json',
              width: 200,
              height: 120,
            ),
            const SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  // custom bottom nav bar - message/call delivery driver
  Widget _buildBottomNavBar(BuildContext context){
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondary,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
        )
      ),
      padding: EdgeInsets.all(25),
      child: Row(
        children: [
          Container(
            // profile pic of driver
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              shape: BoxShape.circle
            ),
            child: IconButton(
                onPressed:() => infoDriver(),
                icon: Icon(Icons.person)
            ),
          ),
          SizedBox(width: 10,),
          // driver detail
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Phạm Hữu Lộc",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
              Text(
                "Driver",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          Spacer(),

          Row(
            children: [
              // message button
              Container(
                // profile pic of driver
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle
                ),
                child: IconButton(
                    onPressed:() => infoDriver(),
                    icon: Icon(Icons.message_sharp,color: Theme.of(context).colorScheme.primary,)
                ),
              ),

              SizedBox(width: 10,),

              // call button
              Container(
                // profile pic of driver
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.background,
                    shape: BoxShape.circle
                ),
                child: IconButton(
                    onPressed:() => infoDriver(),
                    icon: Icon(Icons.call,color: Colors.green,)
                ),
              ),
            ],

          )

        ],
      ),
    );
  }
}
