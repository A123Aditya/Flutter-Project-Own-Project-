import 'package:flutter/material.dart';
import 'package:mystate/Api/pexel.dart';
import 'package:mystate/Model/photos_Model.dart';


class Grid_View extends StatefulWidget {
  const Grid_View({Key? key}) : super(key: key);

  @override
  _Grid_ViewState createState() => _Grid_ViewState();
}

class _Grid_ViewState extends State<Grid_View> {
  final curated = Pexel();
  List<Photos> photo = [];

  @override
  void initState() {
    super.initState();
    fetchcurated();
  }

  Future<void> fetchcurated() async {
    final searchResult = await curated.fetchCurated();
    setState(() {
      photo = searchResult.photos??[];
    });
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, crossAxisSpacing: 5, mainAxisSpacing: 5),
      itemCount: photo.length,
      itemBuilder: (context, index) {
        final image = photo[index];
        return Container(
          //margin: EdgeInsets.all(5),
          child: Image.network(
            image.src!.portrait ?? '',
            fit: BoxFit.cover,
          ),
        );
      },
    );
  }
}
