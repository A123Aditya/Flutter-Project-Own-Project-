import 'package:flutter/material.dart';

class Custom_Textfield {
  Widget custom(
      {required String hintext,
      required TextEditingController controller,
      Icon? icon,
      required bool value,
      required Color bgcolor,
      required Color Hinttext_Color}) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          color: bgcolor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            style: TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            obscureText: value,
            decoration: InputDecoration(
              hintText: hintext,
              icon: icon,
              hintStyle: TextStyle(
                  color: Hinttext_Color, fontSize: 25, letterSpacing: 2),
              focusedBorder: InputBorder.none, // Remove the underline
              enabledBorder: InputBorder.none, // Remove the underline
            ),
            controller: controller,
          ),
        ),
      ),
    );
  }
}
