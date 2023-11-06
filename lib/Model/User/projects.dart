import 'package:eventsy/model/User/currentId.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class Projects{

  currentId currentUser = currentId();

  Future<List> userBookings() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/getSentRequests/$id'));
    //final response = await http.get(Uri.parse('https://eventsy-gray.vercel.app/api/getSentRequests/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getInProgress() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/getUserInProgress/$id'));
    //final response = await http.get(Uri.parse('https://eventsy-gray.vercel.app/api/getUserInProgress/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getComplete() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/getUserComplete/$id'));
    //final response = await http.get(Uri.parse('https://eventsy-gray.vercel.app/api/getUserComplete/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }

  Future<List> getCancelled() async {
    int id = currentUser.currentUserId;
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/api/getUserCancelled/$id'));
    //final response = await http.get(Uri.parse('https://eventsy-gray.vercel.app/api/getUserCancelled/$id'));

    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else {
        return Future.error('Server Error');
    }
  }
}