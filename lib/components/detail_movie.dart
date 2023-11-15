import 'package:flutter/material.dart';
import 'package:projeto_trendx/components/rate_movie.dart';
import 'package:projeto_trendx/models/movie.dart';
import 'package:projeto_trendx/models/movie_list.dart';
import 'package:projeto_trendx/utils/constants.dart';
import 'package:provider/provider.dart';

class DetailMovie extends StatelessWidget {
  final ScrollController controller;
  const DetailMovie({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
     // Obtém o objeto Movie dos argumentos da rota.
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    final MovieList movieList = Provider.of(context, listen: false);

    return Column(
      children: [
        // Barra de indicação de detalhes da página.
        Container(
          margin: const EdgeInsets.only(top: 15),
          width: 40,
          height: 10,
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 2)],
          ),
        ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            controller: controller,
            children: [
               // Título e Avaliação do Filme.
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          movie.title,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          'Release: ${movieList.getOnlYear(movie.releaseDate)}',
                          style: Theme.of(context).textTheme.labelMedium,
                        ),
                      ],
                    ),
                  ),
                  RateMovie(movie: movie),
                ],
              ),
              const SizedBox(height: 50),
               // Descrição do Filme.
              Text(
                movie.overview,
                textAlign: TextAlign.justify,
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const SizedBox(height: 30),
              // Imagem de Fundo do Filme.
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                width: MediaQuery.of(context).size.height * 0.8,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(color: Colors.black, blurRadius: 10)
                    ]),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: movie.backDropPath == ""
                      ? null
                      : Image.network(
                          '${Constants.imagePath}${movie.backDropPath}',
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              const SizedBox(height: 50),
            ],
          ),
        ),
      ],
    );
  }
}
