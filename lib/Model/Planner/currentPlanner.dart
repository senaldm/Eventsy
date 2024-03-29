import 'dart:convert';
import 'package:eventsy/Model/Planner/currentId.dart';
import 'package:http/http.dart' as http;

class CurrentPlanner {
  
  
  Future<List> getCurrentPlanner() async {

    currentId currentuser = currentId();
    int id = currentuser.currentUserId;
    //String url = "http://127.0.0.1:8000/api/getCurrentPlanner/$id";
    String url = "https://dreamy-wilson.34-81-183-3.plesk.page/api/getCurrentPlanner/$id";


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
