import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mystate/Widget/Textfield.dart';
import 'package:mystate/Widget/reuseblecard.dart';

class Welcome extends StatelessWidget {
  
  const Welcome({super.key});
  
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 4,
      itemBuilder:(context, index) {
        return PageView(

        );
      }, 
      );
  }
}
