import 'package:flutter/material.dart';
import 'package:projeto_trendx/components/lists/searched_movie_list.dart';
import 'package:projeto_trendx/components/order.dart';
import 'package:projeto_trendx/components/search_bar.dart';
import 'package:projeto_trendx/models/movie_list.dart';
import 'package:provider/provider.dart';

class MovieSearchScreen extends StatelessWidget {
  const MovieSearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Obter a instância do MovieList usando Provider
    final MovieList movieList = Provider.of<MovieList>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Search',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [SearchBarWidget()],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Mostra o componente Order apenas se houver filmes na lista
          if (movieList.movies.isNotEmpty) const Order(),
          const SizedBox(height: 10),
          // Exibe a lista de filmes pesquisados
          const Expanded(child: SearchedMovies())
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
