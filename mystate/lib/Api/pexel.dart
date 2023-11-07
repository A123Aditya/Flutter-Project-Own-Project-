import 'package:http/http.dart' as http;
import 'package:mystate/Model/Search_Photos.dart';
import 'dart:convert';

import 'package:mystate/Model/photos_Model.dart' as photos_Model;
import 'package:mystate/Model/photos_Model.dart';

class Pexel {
  Future<Photos_Model> fetchCurated() async {
    final url = Uri.https('api.pexels.com', '/v1/curated', {"per_page": "80"});
    final response = await http.get(
      url,
      headers: {
        "Authorization":
            "xVPxiXVokfwSKX0nwq8l2sCqoKRzjVH9SRSrvJyIKJ5pxGQB2MKU9eXr",
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> data = jsonDecode(response.body);
      
      return Photos_Model.fromJson(data);
    }
    else {
      throw Exception('Failed to load search photos');
    } 
  }

  Future<Search_Photos> fetchsearchphotos(String choice) async {
    final url = Uri.https(
        "api.pexels.com", "/v1/search", {'query': choice, 'per_page': '80'});
    final response = await http.get(
      url,
      headers: {
        "Authorization":
            "xVPxiXVokfwSKX0nwq8l2sCqoKRzjVH9SRSrvJyIKJ5pxGQB2MKU9eXr",
      },
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> map = jsonDecode(response.body);
      return Search_Photos.fromJson(map);
    } else {
      throw Exception('Failed to load search photos');
    } // Add a return statement
  }
}
