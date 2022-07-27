import 'dart:convert';

import 'package:html_unescape/html_unescape.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class Translator 
{
 static final String apiKey = 'AIzaSyCYREqpUhdDS6bYSOAP610YgaHgULWfskE'; 

  static Future<String> Translate(String message) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String lang = preferences.getString('lang')!;

    final response = await http.post(Uri.parse('https://translation.googleapis.com/language/translate/v2?target=$lang&key=$apiKey&q=$message'));

    if (response.statusCode == 200) 
    {
      final data = jsonDecode(response.body);
      final translations = data['data']['translations'] as List;
      return HtmlUnescape().convert(translations.first['translatedText']);
    }
    // Additional return to allow all routes to return
    return 'error';
  }
}