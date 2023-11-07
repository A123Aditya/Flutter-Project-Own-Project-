import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mystate/Screen/welcome/Welcome.dart';
import 'package:mystate/Widget/Textfield.dart';
import 'package:mystate/Widget/reuseblecard.dart';

class Sign_Up extends StatelessWidget {
  var firstname_controller = TextEditingController();

  var Email_controller = TextEditingController();

  var Password_controller = TextEditingController();

  Sign_Up({super.key});
  final custom = Custom_Textfield();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black54,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              Column(
                // mainAxisAlignment:
                //     MainAxisAlignment.center, // Center vertically
                children: [
                  Text('Welcome',
                      style: TextStyle(
                          color: Color.fromARGB(255, 244, 244, 244),
                          fontWeight: FontWeight.w700,
                          fontSize: 30)),
                  Text('Let\'s create your account',
                      style: TextStyle(
                          color: Colors.white38,
                          fontWeight: FontWeight.w700,
                          fontSize: 25)),
                  custom.custom(
                      hintext: 'First name',
                      controller: firstname_controller,
                      icon: Icon(Icons.person, color: Colors.black, size: 45),
                      value: false,
                      bgcolor: Colors.white70,
                      Hinttext_Color: Colors.black),
                  custom.custom(
                      hintext: 'E-mail',
                      controller: Email_controller,
                      icon: Icon(Icons.mail_rounded,
                          color: Colors.black, size: 45),
                      value: false,
                      bgcolor: Colors.white70,
                      Hinttext_Color: Colors.black),
                  custom.custom(
                      hintext: 'Password',
                      controller: Password_controller,
                      icon: Icon(Icons.lock, color: Colors.black, size: 45),
                      value: false,
                      bgcolor: Colors.white70,
                      Hinttext_Color: Colors.black),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () => FirebaseAuth.instance
                        .createUserWithEmailAndPassword(
                            email: Email_controller.text,
                            password: Password_controller.text)
                        .then((value) {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Welcome(),
                          ));
                    }),
                    child: Container(
                      width: 350, // Set the desired width
                      height: 65, // Set the desired height
                      child: Card(
                        color: Color.fromARGB(255, 233, 118, 254),
                        child: Center(
                          child: Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 30, // You can adjust the font size
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
