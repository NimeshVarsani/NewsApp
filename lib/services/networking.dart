import 'dart:convert';

import 'package:http/http.dart' as http;

// const String url = 'https://inshorts.deta.dev/news?category=sports';

class NetworkHelper{

  Future<List> fetchNews(String url) async {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      var jsonObj = jsonDecode(response.body)['data'] as List;
      return jsonObj;
    }
    else {
      throw Exception('Failed to load news');
    }
  }
}