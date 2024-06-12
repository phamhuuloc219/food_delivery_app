import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_title.dart';
import 'package:food_delivery_app/models/restaurant.dart';
import 'package:food_delivery_app/pages/about_us.dart';
import 'package:food_delivery_app/pages/settings_page.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';
import 'package:food_delivery_app/services/auth/login_or_register.dart';
import 'package:provider/provider.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {

  User user = FirebaseAuth.instance.currentUser!;

  void logOut(){
    final authService = AuthService();
    authService.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //app logo
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: IconButton(
              icon: Icon(Icons.person,size: 80),
              color: Theme.of(context).colorScheme.inversePrimary,
              onPressed: () {  },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "${user.displayName?? user.email?? user.phoneNumber??""}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,
            ),
          ),

          //home list title
          MyDrawerTitle(
              ontap:() => Navigator.pop(context),
              text: "H O M E",
              icon: Icons.home
          ),

          // settings list title
          MyDrawerTitle(
              ontap: () {
                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SettingsPage(),
                    )
                );

              },
              text: "S E T T I N G S",
              icon: Icons.settings
          ),
          //settings list title
          MyDrawerTitle(
            icon: Icons.info,
            text: 'A B O U T  U S',
            ontap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AboutUs(),
                ),
              );
            },
          ),

          const Spacer(),

          //logout list title
          MyDrawerTitle(
              ontap: () {
                logOut();
                context.read<Restaurant>().clearCart();
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => LoginOrRegister(),));
              },
              text: "L O G O U T",
              icon: Icons.logout
          ),
          const SizedBox(height: 25.0),
        ],
      ),
    );
  }
}
