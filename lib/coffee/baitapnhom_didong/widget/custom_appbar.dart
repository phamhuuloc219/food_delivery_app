import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomAppbar extends StatelessWidget {
  final IconData leftIcon;
  final IconData righIcon;
  final Function? leftCallback;
  final Function? rightCallback;
  CustomAppbar(this.leftIcon, this.righIcon, {this.leftCallback, this.rightCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: leftCallback != null ? () => leftCallback!() : null,
            child: Container(
              padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
              decoration: BoxDecoration(
                // shape: BoxShape.circle,
                // color: Colors.white,
              ),
              child: Icon(leftIcon),
            ),
          ),
    //       Container(
    //         padding: EdgeInsets.all(8),
    //         decoration: BoxDecoration(
    //           shape: BoxShape.circle,
    //           color: Colors.white,
    //         ),
    //         child: Icon(righIcon),
    //       ),
    //     ],
    //   ),
    // );
    GestureDetector( // nút bấm bên phải
    onTap: rightCallback != null ? () => rightCallback!() : null,
     child: Container(
      padding: EdgeInsets.fromLTRB(16, 8, 8, 8),
      decoration: BoxDecoration(
      //shape: BoxShape.circle,
      //color: Colors.white,
    ),
     child: Icon(righIcon),
      ),
    ),
    ],

  ),
  );
}
}
