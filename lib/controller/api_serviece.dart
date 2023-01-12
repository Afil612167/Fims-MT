
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../model/model_class.dart';

class ApiServiece {
  Future<FilmsDetails> getFilmDetails(category, language, genre, sort) async {
    String url = 'https://hoblist.com/api/movieList';
    var obj = {
      "category": category,
      "language": language,
      "genre": genre,
      "sort": sort
    };
    var respons = await http.post(
      Uri.parse(url),
      body: obj,
    );
    print('status code is'+respons.statusCode.toString());
    return FilmsDetails.fromJson(jsonDecode(respons.body));
  }
}