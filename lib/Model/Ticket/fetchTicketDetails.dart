// ignore_for_file: file_names

import 'dart:convert';

import 'package:http/http.dart' as http;

class FetchTicketDetails {
  Future<List<dynamic>> fetchTickets($userCode) async {
    String user = $userCode;
    String uri = 'https://nice-williams.34-81-183-3.plesk.page/validate/$user';

    final response = await http.get(Uri.parse(uri));

    try {
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        return data;
      } else {
        throw Exception(
            'Opps!\nAdd correct UserCode which send to QR Code creator via Email.');
      }
    } catch (e) {
      throw Exception('Opps!\nFailed to load data.Check Your connection and retry');
     
    }
  }
}
