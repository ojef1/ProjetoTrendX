import 'package:flutter/material.dart';
import 'package:projeto_trendx/api/api.dart';
import 'package:projeto_trendx/components/cards/top_rated_card_movie.dart';
import 'package:projeto_trendx/models/movie.dart';

class TopRatedList extends StatefulWidget {
  const TopRatedList({super.key});

  @override
  State<TopRatedList> createState() => _TopRatedListState();
}

class _TopRatedListState extends State<TopRatedList> {
  late Future<List<Movie>> topRatedMovies;

  @override
  void initState() {
    super.initState();
    // Inicializa a lista de filmes mais bem avaliados quando o widget é criado.
    topRatedMovies = Api().getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    // Usa o FutureBuilder para lidar com a obtenção assíncrona da lista de filmes mais bem avaliados.
    return FutureBuilder(
      future: topRatedMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Se houver dados, exibe o widget TopRatedCard com os filmes mais bem avaliados.
          return TopRatedCard(snapshot: snapshot);
        } else {
          // Se ainda estiver carregando, exibe um indicador de carregamento.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
