import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mystate/Widget/Textfield.dart';
import 'package:mystate/Widget/card.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final custom = Custom_Textfield();
  final email_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          
          children: [
            
            Image.asset(
              'assets/DarkMountain1.jpg', 
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),

            Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.black45,
                      radius: 40,
                      child: CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 248, 132, 132),
                        radius: 40,
                        child: Icon(
                          Icons.person,
                          color: Color(0xffCCCCCC),
                          size: 50,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Custom_card(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
