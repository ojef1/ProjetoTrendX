import 'package:flutter/material.dart';
import 'package:projeto_trendx/components/rate_movie.dart';
import 'package:projeto_trendx/utils/constants.dart';
import 'package:projeto_trendx/utils/routes.dart';

class TopRatedCard extends StatelessWidget {
  final AsyncSnapshot snapshot;
  // Construtor que recebe um snapshot contendo dados assíncronos.
  const TopRatedCard({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
     // Um widget de coluna contendo uma seção de filmes mais bem avaliados.
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da seção.
        Text('Top rated movies',
            style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 20),
        // Lista horizontal de filmes mais bem avaliados.
        SizedBox(
          height: 200,
          width: double.infinity,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            itemCount: 10,
            itemBuilder: (context, itemIndex) {
              // Obtém um filme do snapshot.
              final movie = snapshot.data[itemIndex];
               // Retorna um widget contendo a imagem do filme e a classificação.
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.DETAIL_PAGE, arguments: movie),
                  child: Stack(
                    children: [
                      // Exibe a imagem do filme com bordas arredondadas.
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.6,
                          height: MediaQuery.of(context).size.height * 0.3,
                          child: Image.network(
                            '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                            filterQuality: FilterQuality.high,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      // Exibe a classificação do filme na parte inferior da imagem.
                      RateMovie(movie: snapshot.data[itemIndex]),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 38),
      ],
    );
  }
}
