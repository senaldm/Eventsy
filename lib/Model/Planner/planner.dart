import 'dart:convert';
import 'package:http/http.dart' as http;

class Planners {
  String url = "https://nice-williams.34-81-183-3.plesk.page/planners/";
  
  Future<List> getAllPlanners() async {
    try {
      final response = await http.get(Uri.parse(url));
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
