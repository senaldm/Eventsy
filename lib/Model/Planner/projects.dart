import 'package:eventsy/model/Planner/currentId.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Projects{

  currentId currentUser = currentId();

  Future<List> getBookRequests() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/getUserBookRequests/$id'));
    //final response = await http.get(Uri.parse('https://eventsy-gray.vercel.app/api/getUserBookRequests/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getInProgress() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/getPlannerInProgress/$id'));
    //final response = await http.get(Uri.parse('https://eventsy-gray.vercel.app/api/getPlannerInProgress/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getComplete() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/getPlannerCompleted/$id'));
    //final response = await http.get(Uri.parse('https://eventsy-gray.vercel.app/api/getPlannerCompleted/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getCancelled() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/getPlannerCancelled/$id'));
    //final response = await http.get(Uri.parse('https://eventsy-gray.vercel.app/api/getPlannerCancelled/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }
}