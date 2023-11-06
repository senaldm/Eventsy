import 'package:eventsy/model/Planner/currentId.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Projects{

  currentId currentUser = currentId();

  Future<List> getBookRequests() async {
    int id = currentUser.currentUserId;
    //final response = await http.post(Uri.parse('http://127.0.0.1:8000/api/getUserBookRequests/$id'));
    final response = await http.post(Uri.parse('https://dreamy-wilson.34-81-183-3.plesk.page/api/getUserBookRequests/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getInProgress() async {
    int id = currentUser.currentUserId;
    //final response = await http.post(Uri.parse('http://127.0.0.1:8000/api/getPlannerInProgress/$id'));
    final response = await http.post(Uri.parse('https://dreamy-wilson.34-81-183-3.plesk.page/api/getPlannerInProgress/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getComplete() async {
    int id = currentUser.currentUserId;
    //final response = await http.post(Uri.parse('http://127.0.0.1:8000/api/getPlannerCompleted/$id'));
    final response = await http.post(Uri.parse('https://dreamy-wilson.34-81-183-3.plesk.page/api/getPlannerCompleted/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getCancelled() async {
    int id = currentUser.currentUserId;
    //final response = await http.post(Uri.parse('http://127.0.0.1:8000/api/getPlannerCancelled/$id'));
    final response = await http.post(Uri.parse('https://dreamy-wilson.34-81-183-3.plesk.page/api/getPlannerCancelled/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }
}