import 'package:flutter/material.dart';

class customcontainer {
  Widget buildCategoryItem({required String imageurl, required String text}) {
    return Column(
      children: [
        Container(
          width: 90.0,
          height: 90.0,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              image: NetworkImage(imageurl),
              fit: BoxFit.cover,
              alignment: Alignment.centerLeft,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        SizedBox(height: 8.0), // Space between image and text
        Text(
          text,
          style: TextStyle(
              fontSize: 16.0, color: Colors.white, fontWeight: FontWeight.w400),
        ),
      ],
    );
  }
}
