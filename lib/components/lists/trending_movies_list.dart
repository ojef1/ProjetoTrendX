import 'package:flutter/material.dart';
import 'package:projeto_trendx/api/api.dart';
import 'package:projeto_trendx/components/cards/trending_card_movie.dart';
import 'package:projeto_trendx/models/movie.dart';

class TrendingList extends StatefulWidget {
  const TrendingList({super.key});

  @override
  State<TrendingList> createState() => _TrendingListState();
}

class _TrendingListState extends State<TrendingList> {
  late Future<List<Movie>> trendingMovies;

  @override
  void initState() {
    super.initState();
     // Inicializa a lista de filmes em destaque quando o widget é criado.
    trendingMovies = Api().getTrendingMovies();
  }

  @override
  Widget build(BuildContext context) {
     // Usa o FutureBuilder para lidar com a obtenção assíncrona da lista de filmes em destaque.
    return FutureBuilder(
      future: trendingMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
           // Se houver dados, exibe o widget TrendingCard com os filmes em destaque.
          return TrendingCard(snapshot: snapshot);
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
