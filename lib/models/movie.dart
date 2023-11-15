import 'package:flutter/material.dart';

// Fábrica para criar instâncias de filmes.
class MovieFactory {
  static Movie createMovie({
    int id = 0,
    String title = '',
    String backDropPath = '',
    String overview = '',
    String posterPath = '',
    double voteAverage = 0.0,
    String releaseDate = '',
    bool isFavorite = false,
  }) {
    return Movie(
      id: id,
      title: title,
      backDropPath: backDropPath,
      overview: overview,
      posterPath: posterPath,
      voteAverage: voteAverage,
      releaseDate: releaseDate,
      isFavorite: isFavorite,
    );
  }
}

// Classe para representar um filme, estendendo ChangeNotifier para notificar os ouvintes sobre alterações.
class Movie with ChangeNotifier {
  final int id;
  final String title;
  final String backDropPath;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;
  bool isFavorite;

  // Construtor para criar uma instância de Movie.
  Movie({
    required this.id,
    required this.title,
    required this.backDropPath,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    this.isFavorite = false,
  });

   // Método de fábrica para criar uma instância de Movie a partir de um mapa JSON.
  factory Movie.fromJson(Map<String, dynamic> json) {
    return MovieFactory.createMovie(
      id: json['id'] ?? 0,
      title: json['title'] ?? "",
      backDropPath: json['backdrop_path'] ?? "",
      overview: json['overview'] ?? "",
      posterPath: json['poster_path'] ?? "",
      voteAverage: json['vote_average'] ?? 0.0,
      releaseDate: json['release_date'] ?? "",
    );
  }

  // Método para alternar o status de favorito para um filme específico.
  void toggleFavorite(int movieId) {
    if (id == movieId) {
      isFavorite = !isFavorite;
      // Notifica os ouvintes sobre a alteração no status de favorito.
      notifyListeners();
    }
  }
}
