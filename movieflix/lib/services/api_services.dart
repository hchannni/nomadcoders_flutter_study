import 'dart:convert';

import 'package:movieflix/models/movie_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl =
      "https://movies-api.nomadcoders.workers.dev/popular";
  static const String popular = "popular";
  static const String nowPlaying = "now-playing";
  static const String comingSoon = "coming-soon";

  static Future<List<MovieModel>> getPopularMovies() async {
    List<MovieModel> popularMovies = [];
    final uri = Uri.parse("$baseUrl/$popular");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        final instance = MovieModel.fromJson(movie);
        popularMovies.add(instance);
      }

      return popularMovies;
    } else {
      throw Error();
    }
  }

  static Future<List<MovieModel>> getNowPlayingMovies() async {
    List<MovieModel> nowPlayingMovies = [];
    final uri = Uri.parse("$baseUrl/$nowPlaying");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        final instance = MovieModel.fromJson(movie);
        nowPlayingMovies.add(instance);
      }

      return nowPlayingMovies;
    } else {
      throw Error();
    }
  }

  static Future<List<MovieModel>> getComingSoonMovies() async {
    List<MovieModel> comingSoonMovies = [];
    final uri = Uri.parse("$baseUrl/$comingSoon");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final List<dynamic> movies = jsonDecode(response.body)["results"];
      for (var movie in movies) {
        final instance = MovieModel.fromJson(movie);
        comingSoonMovies.add(instance);
      }

      return comingSoonMovies;
    } else {
      throw Error();
    }
  }
}
