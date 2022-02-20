import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:yobit/logic/models/challenge.dart';
import 'package:yobit/utils/httpClient.dart';

Future<List<Challenge>> getFeaturedChallenges() async {
  final response = await HttpClient.get('challenge/featured');
  List<dynamic> res = jsonDecode(response.body);
  return res.map((e) => Challenge.fromJson(e)).toList();
}

Future<List<Challenge>> getRegularChallenges() async {
  final response = await HttpClient.get('challenge');

  if (response.statusCode == 200) {
    List<dynamic> res = jsonDecode(response.body);
    return res.map((e) => Challenge.fromJson(e)).toList();
  }
  throw Exception("Failed to load top challenges");
}
