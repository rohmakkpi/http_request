import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:http_request/models/movie.dart';

class HttpService{
  final String apiKey ='f3756c274530ef53cc0c521c9821e337';
  final String baseUrl ='https://api.themoviedb.org/3/';

  Future<List?> getPopularMovies() async{
    final String uri = '${baseUrl}movie/popular?api_key=$apiKey'; //baseUrl + apiKey; ;

    http.Response result = await http.get(Uri.parse(uri));
    if(result.statusCode == HttpStatus.ok){
      print("Sukses");
      final jsonResponse = json.decode(result.body);
      final movieMap = jsonResponse['results'];
      print(jsonResponse.toString());
      List movies = movieMap.map((i) => Movie.fromJson(i)).toList();
      return movies;
    } else{
      print("Fail");
      return null;
    }
  }
}