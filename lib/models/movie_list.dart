import 'package:flutter/material.dart';
import 'package:projeto_trendx/api/api.dart';
import 'package:projeto_trendx/models/movie.dart';

// Classe que gerencia a lista de filmes e fornece funcionalidades relacionadas.
class MovieList with ChangeNotifier {
  List<Movie> _movies = []; // Lista interna de filmes.
  bool _isSearching =
      false; // Flag indicando se está em andamento uma operação de pesquisa.
  bool isFavorite = false; //valor inicial indicando se é favorito ou não.
  String _order = ""; // Ordem atual da lista de filmes.

  // Métodos de acesso para obter cópias da lista de filmes e dos filmes favoritos.
  List<Movie> get movies => [..._movies];
  List<Movie> get favoriteMovies =>
      _movies.where((movie) => movie.isFavorite).toList();

  // Obter a ordem atual da lista de filmes.
  String get order => _order;

  // Obter o número total de filmes na lista.
  int get moviesCount => _movies.length;

  // Verificar se uma pesquisa está em andamento.
  bool get isSearching => _isSearching;

  // Método para ordenar os filmes por título.
  void sortMoviesByTitle() {
    _movies.sort((a, b) => a.title.compareTo(b.title));
    _order = "A - Z";
    notifyListeners();
  }

  // Método para ordenar os filmes por data de lançamento.
  void sortMoviesByRelease() {
    _movies.sort((a, b) => b.releaseDate.compareTo(a.releaseDate));
    _order = "Ano de lançamento";
    notifyListeners();
  }

  // Método para extrair apenas o ano de uma data completa.
  String getOnlYear(String fullDate) {
    String ano = "";
    if (fullDate != "") {
      ano = fullDate.substring(0, 4);
    }
    return ano;
  }

  // Método para realizar uma operação de pesquisa de filmes.
  Future<void> searchMovies(String query) async {
    _isSearching = true; // Indicar que a pesquisa está em andamento.
    notifyListeners(); // Notificar os ouvintes sobre a alteração.

    _movies.clear(); // Limpar a lista de filmes.
    _movies = await Api()
        .getSearchedMovies(query); // Obter filmes da API com base na pesquisa.
    sortMoviesByTitle(); // Ordenar os filmes por título.

    _isSearching = false; // Indicar que a pesquisa foi concluída.
    notifyListeners(); // Notificar os ouvintes sobre a alteração.
  }
}
