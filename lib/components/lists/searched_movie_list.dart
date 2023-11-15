import 'package:flutter/material.dart';
import 'package:projeto_trendx/components/cards/searched_card_movie.dart';
import 'package:projeto_trendx/models/movie_list.dart';
import 'package:provider/provider.dart';

class SearchedMovies extends StatelessWidget {
  const SearchedMovies({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Obtém a instância de MovieList usando o Provider.
    final MovieList movieList = Provider.of(context);

    // Verifica se a pesquisa está em andamento e exibe um indicador de carregamento.
    if (movieList.isSearching) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
     // Se não tiver filmes na lista, exibe um texto indicando a ação de pesquisa.
    if (movieList.moviesCount == 0) {
      return Center(
        child: Text("Pesquise o filme que deseja ver :)",
            style: Theme.of(context).textTheme.titleSmall),
      );
    }
    // Se houver resultados, exibe o widget SearchedCard para mostrar os filmes encontrados.
    return SearchedCard(movies: movieList.movies);
  }
}
