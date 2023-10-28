
import 'dart:convert';

import 'package:eventsy/Model/Planner/currentId.dart';
import 'package:http/http.dart' as http;

class Friends{

  currentId currentUser = currentId();
    
  Future<List> getRequests() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('https://nice-williams.34-81-183-3.plesk.page/getRequests/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getFriends() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('https://nice-williams.34-81-183-3.plesk.page/api/getFriends/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }
}