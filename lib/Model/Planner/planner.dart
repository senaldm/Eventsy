import 'dart:convert';
import 'package:http/http.dart' as http;

class Planners {

  //String url = "http://127.0.0.1:8000/api/planners";
  String url = "https://dreamy-wilson.34-81-183-3.plesk.page/api/planners";

  
  Future<List> getAllPlanners() async {
    try {
      final response = await http.post(Uri.parse(url));
      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return Future.error('Server Error');
      }
    } catch (e) {
      return Future.error(e);
    }
  }
}
