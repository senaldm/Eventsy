
import 'dart:convert';

import 'package:eventsy/model/Planner/currentId.dart';
import 'package:http/http.dart' as http;

class PlannerFavourites{

  currentId currentUser = currentId();
    
  Future<List> getRequests() async {
    int id = currentUser.currentUserId;
    //final response = await http.post(Uri.parse('http://127.0.0.1:8000/api/getRequests/$id'));
    final response = await http.post(Uri.parse('https://dreamy-wilson.34-81-183-3.plesk.page/api/getRequests/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getFriends() async {
    int id = currentUser.currentUserId;
    //final response = await http.post(Uri.parse('http://127.0.0.1:8000/api/getFriends/$id'));
    final response = await http.post(Uri.parse('https://dreamy-wilson.34-81-183-3.plesk.page/api/getFriends/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getFavourites() async {
    int id = currentUser.currentUserId;
    //final response = await http.post(Uri.parse('http://127.0.0.1:8000/api/getFavourites/$id'));
    final response = await http.post(Uri.parse('https://dreamy-wilson.34-81-183-3.plesk.page/api/getFavourites/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }
}