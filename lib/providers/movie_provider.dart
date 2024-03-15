import 'dart:convert';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:movie/models/movie.dart';
import 'package:movie/models/now_playing_response.dart';

class MovieProvider extends ChangeNotifier{

  String _apiKey = '6ae4ba0ab41510d8ce91e355e0b6a511';
  String _baseUrl = 'api.themoviedb.org';
  String _language = 'es-ES';


  List<Movie> nowPlayingMovies = [];

  MovieProvider(){
    this.getOnDisplayNowPlayingMovie();
  }

  getOnDisplayNowPlayingMovie() async {
    Uri url = Uri.https(
      _baseUrl,
      '3/movie/now_playing',
      {
        'api_key' : _apiKey,
        'language': _language,
        'page'    : '1'
      }
    );
    Response response = await http.get(url);
    NowPlayingResponse nowPlayingResponse = NowPlayingResponse.fromRawJson(response.body);
    nowPlayingMovies = nowPlayingResponse.results;
    notifyListeners();
  }
}