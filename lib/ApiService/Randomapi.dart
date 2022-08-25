import 'dart:convert';

import 'package:apiproject3/Model/Datamodel.dart';
import 'package:http/http.dart' as http;

class Randomapi {
  String url = "https://randomuser.me/api/?results=50";

  Future<Datamodel?> getUser() async {
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        Datamodel data = Datamodel.fromJson(jsonDecode(response.body));
        //print(data.results![0].email);
        // print(data.results);
        // print(data.info!.seed);
        return data;
      } else {
        return null;
      }
    } catch (e) {
      rethrow;
    }
  }



  
}
