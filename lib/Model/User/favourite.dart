
import 'dart:convert';

import 'package:eventsy/model/User/currentId.dart';
import 'package:http/http.dart' as http;

class UserFavourites{

  currentId currentUser = currentId();
  
  Future<List> getUserFavourites() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/getUserFavourites/$id'));
    //final response = await http.get(Uri.parse('https://eventsy-gray.vercel.app/api/getUserFavourites/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }
}