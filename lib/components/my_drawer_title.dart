import 'package:flutter/material.dart';

class MyDrawerTitle extends StatelessWidget {
  final String text;
  final IconData? icon;
  final void Function()? ontap;
  const MyDrawerTitle({
    super.key,
    required this.ontap,
    required this.text,
    required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: ListTile(
        title: Text(
          text,
          style: TextStyle(color:Theme.of(context).colorScheme.inversePrimary),
        ),
        leading: Icon(
            icon,
            color: Theme.of(context).colorScheme.inversePrimary
        ),
        onTap: ontap,
      ),
    );
  }
}
