import 'dart:convert';
import 'package:api/models/name.dart';
import 'package:api/models/usernames.dart';
import 'package:http/http.dart' as http;

class userapis {
  static Future<List<properties>> fetch() async {
    const url = 'https://randomuser.me/api/?results=100';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final value = results.map(
      (e) {
        final nam = names(
            title: e['name']['title'],
            first: e['name']['first'],
            last: e['name']['last']);
        return properties(
          gender: e['gender'],
          phone: e['phone'],
          email: e['email'],
          name: nam,
        );
      },
    ).toList();

    return value;
  }
}
