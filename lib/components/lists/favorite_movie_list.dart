import 'package:flutter/material.dart';
import 'package:projeto_trendx/components/cards/favorite_card_movie.dart';
import 'package:projeto_trendx/models/movie.dart';
import 'package:projeto_trendx/models/movie_list.dart';
import 'package:provider/provider.dart';

class FavoriteMovies extends StatelessWidget {
  const FavoriteMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Obtém a instância de MovieList usando o Provider.
    final MovieList movieList = Provider.of(context);

    // Obtém a lista de filmes favoritos da instância de MovieList.
    final List<Movie> favoriteMovies = movieList.favoriteMovies;

// Verifica se a lista de filmes favoritos está vazia.
    if (favoriteMovies.isEmpty) {
      return Center(
        // Exibe uma mensagem se não houver filmes favoritos.
        child: Text("Você ainda não tem favoritos :(",
            style: Theme.of(context).textTheme.titleSmall),
      );
    }
    // Se houver filmes favoritos, exibe o widget FavoriteCard para mostrá-los.
    return FavoriteCard(movies: favoriteMovies);
  }
}
