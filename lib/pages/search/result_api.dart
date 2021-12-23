import 'dart:convert';
import 'package:http/http.dart' as http;
import 'search_result.dart';

Future<SearchResult>? searchWordAPI(String keyword) async {
  final url = Uri.parse("https://api.dictionaryapi.dev/api/v2/entries/en/" + keyword.trim());
  var response = await http.get(url, headers:{"Content-Type": 
 "application/json"});
  final jsonData = json.decode(response.body);
  return SearchResult.fromJson(jsonData[0]);
}