import 'package:flutter/material.dart';
import 'package:projeto_trendx/components/lists/top_rated_movie_list.dart';
import 'package:projeto_trendx/components/lists/trending_movies_list.dart';
import 'package:projeto_trendx/components/lists/upcoming_movies_list.dart';

class ListMovies extends StatelessWidget {
  const ListMovies({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Um widget SingleChildScrollView é usado para permitir rolar o conteúdo na vertical.
    return const SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(children: [
          // Exibe a lista de filmes em destaque.
          TrendingList(),
          // Exibe a lista de filmes mais bem avaliados.
          TopRatedList(),
          // Exibe a lista de lançamentos.
          UpComingList(),
        ]),
      ),
    );
  }
}
