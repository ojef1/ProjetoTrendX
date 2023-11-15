import 'dart:convert';

import 'package:projeto_trendx/models/movie.dart';
import 'package:projeto_trendx/utils/constants.dart';
import 'package:http/http.dart' as http;

// Classe responsável por interagir com a API para obter informações sobre filmes.
class Api {
  static const _searchUrl = Constants.searchUrl;
  static const _topRatedUrl = Constants.topRatedUrl;
  static const _upComingUrl = Constants.upComingUrl;
  static const _trendingUrl = Constants.trendingUrl;
  

// Obtém uma lista de filmes em alta.
  Future<List<Movie>> getTrendingMovies() async {
    final response = await http.get(Uri.parse(_trendingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      print('Error Status Code: ${response.statusCode}');
      print('Error Body: ${response.body}');
      throw Exception('Error');
    }
  }

// Obtém uma lista de filmes com melhores votações.
  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      print('Error Status Code: ${response.statusCode}');
      print('Error Body: ${response.body}');
      throw Exception('Error');
    }
  }

// Obtém uma lista de filmes que serão lançados.
  Future<List<Movie>> getUpComingMovies() async {
    final response = await http.get(Uri.parse(_upComingUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      print('Error Status Code: ${response.statusCode}');
      print('Error Body: ${response.body}');
      throw Exception('Error');
    }
  }

// Obtém uma lista de filmes pesquisados.
  Future<List<Movie>> getSearchedMovies(String query) async {
    final searchUrl = '$_searchUrl?api_key=${Constants.apiKey}&query=$query';
    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      final decodeData = jsonDecode(response.body)['results'] as List;
      return decodeData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      print('Error Status Code: ${response.statusCode}');
      print('Error Body: ${response.body}');
      throw Exception('Error');
    }
  }
}
