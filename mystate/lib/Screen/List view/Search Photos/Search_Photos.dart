import 'package:flutter/material.dart';
import 'package:mystate/Screen/List%20view/Search%20Photos/Grid.dart';
import 'package:mystate/Widget/Roundedcontainer.dart';
import 'package:mystate/Widget/Textfield.dart';

class SearchPhotos extends StatefulWidget {
  SearchPhotos({Key? key});

  @override
  State<SearchPhotos> createState() => _SearchPhotosState();
}

class _SearchPhotosState extends State<SearchPhotos> {
  final textediting = TextEditingController();

  var round = customcontainer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Custom_Textfield().custom(
                  Hinttext_Color: Colors.white60,
                  bgcolor: Color.fromARGB(255, 69, 38, 74),
                  controller: textediting,
                  hintext: 'Enter your Intrest',
                  value: false,
                  icon: Icon(
                    Icons.wallpaper,
                    color: Colors.redAccent,
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // round.buildCategoryItem(
                    //     imageurl:
                    //         "https://images.pexels.com/photos/2335126/pexels-photo-2335126.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                    //     text: "Mountain")
                  ],
                ),
              ),
              Expanded(
                child: Grid_View(), // Include the Grid_View widget here
              ),
            ],
          ),
        ),
      ),
    );
  }
}
