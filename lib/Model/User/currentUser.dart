import 'dart:convert';
import 'package:eventsy/model/User/currentId.dart';
import 'package:http/http.dart' as http;

class CurrentUser {
  
  
  Future<List> getCurrentUser() async {

    currentId currentuser = currentId();
    int id = currentuser.currentUserId;
    //String url = "http://127.0.0.1:8000/api/getCurrentUser/$id";
    String url = "https://dreamy-wilson.34-81-183-3.plesk.page/api/getCurrentUser/$id";


    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        //print([jsonDecode(response.body)]);
        return [jsonDecode(response.body)];
      } 
      else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
