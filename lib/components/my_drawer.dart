import 'package:flutter/material.dart';
import 'package:food_delivery_app/components/my_drawer_title.dart';
import 'package:food_delivery_app/pages/settings_page.dart';
import 'package:food_delivery_app/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

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
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.inversePrimary,
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

          const Spacer(),

          //logout list title
          MyDrawerTitle(
              ontap: () {
                logOut();
                Navigator.pop(context);

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
