import 'package:flutter/material.dart';
import 'package:projeto_trendx/api/api.dart';
import 'package:projeto_trendx/components/cards/upcoming_card_movie.dart';
import 'package:projeto_trendx/models/movie.dart';

class UpComingList extends StatefulWidget {
  const UpComingList({super.key});

  @override
  State<UpComingList> createState() => _UpComingListState();
}

class _UpComingListState extends State<UpComingList> {
  late Future<List<Movie>> upComingMovies;

  @override
  void initState() {
    super.initState();
    // Inicializa a lista de filmes que serão lançados em breve quando o widget é criado.
    upComingMovies = Api().getUpComingMovies();
  }

  @override
  Widget build(BuildContext context) {
    // Usa o FutureBuilder para lidar com a obtenção assíncrona da lista de lançamentos.
    return FutureBuilder(
      future: upComingMovies,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // Se houver dados, exibe o widget UpComingCard com os lançamentos.
          return UpComingCard(snapshot: snapshot);
        } else {
          // Se houver dados, exibe o widget UpComingCard com os filmes que serão lançados em breve.
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
