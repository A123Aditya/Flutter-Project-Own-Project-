import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mystate/Homepage/Homepage.dart';
import 'package:mystate/Screen/List%20view/Search%20Photos/Search_Photos.dart';
import 'package:mystate/Screen/Sign_Up.dart';
import 'package:mystate/Widget/Textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Custom_card extends StatefulWidget {
  Custom_card({super.key});
  @override
  State<Custom_card> createState() => _Custom_cardState();
}

class _Custom_cardState extends State<Custom_card> {
  @override
  void initState() {
    getValue();
    super.initState();
  }

  final custom = Custom_Textfield();

  static const String isloggedin = "Login";

  final email_controller = TextEditingController();

  final password_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            custom.custom(
              value: false,
              hintext: "Enter your Email",
              controller: email_controller,
              icon: Icon(Icons.mail, color: Colors.orange),
              bgcolor: Colors.black54,
              Hinttext_Color: Colors.white,
            ),
            custom.custom(
                value: false,
                hintext: "Enter your Password",
                controller: password_controller,
                icon: Icon(Icons.lock, color: Colors.orange),
                bgcolor: Colors.black54,
                Hinttext_Color: Colors.white),
            InkWell(
              onTap: () => FirebaseAuth.instance
                  .signInWithEmailAndPassword(
                      email: email_controller.text,
                      password: password_controller.text)
                  .then((value) async {
                var pref = await SharedPreferences.getInstance();
                pref.setBool(isloggedin, true);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SearchPhotos(),
                    ));
              }),
              child: Container(
                width: 120, // Set the desired width
                height: 60, // Set the desired height
                child: Card(
                  color: Color.fromARGB(255, 233, 118, 254),
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18, // You can adjust the font size
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => null,
                    child: Container(
                      width: 45, // Adjust the width to fit the image
                      height: 45, // Adjust the height if needed
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        image: DecorationImage(
                          image: AssetImage("assets/Google.jpg"),
                          fit:
                              BoxFit.cover, // Adjust the fit property as needed
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Text(
                        "Don't have account?",
                        style: TextStyle(
                            color: Colors.white54, fontWeight: FontWeight.w900),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Sign_Up()));
                          },
                          child: Text('Sign Up',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w900)))
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  void getValue() async {
    var pref = await SharedPreferences.getInstance();
    var boolvalue = pref.getBool(isloggedin);
    if (boolvalue != null) {
      if (boolvalue) {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => SearchPhotos(),
            ));
      } else {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => Homepage(),
            ));
      }
    }
  }
}
