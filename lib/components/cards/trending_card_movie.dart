import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:projeto_trendx/utils/constants.dart';
import 'package:projeto_trendx/utils/routes.dart';

class TrendingCard extends StatelessWidget {
  final AsyncSnapshot snapshot;

  // Construtor que recebe um snapshot contendo dados assíncronos.
  const TrendingCard({Key? key, required this.snapshot}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da seção.
        Text('Trending Movies', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 20),
        // Carrossel horizontal de filmes em destaque.
        SizedBox(
          width: double.infinity,
          child: CarouselSlider.builder(
            itemCount: 10,
            options: CarouselOptions(
              height: 300,
              autoPlay: true,
              viewportFraction: 0.55,
              enlargeCenterPage: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: const Duration(seconds: 2),
            ),
            itemBuilder: (context, itemIndex, pageViewIndex) {
              // Obtém um filme do snapshot.
              final movie = snapshot.data[itemIndex];
              // Retorna um GestureDetector que navega para a página de detalhes ao tocar no filme.
              return GestureDetector(
                onTap: () => Navigator.of(context).pushNamed(
                  AppRoutes.DETAIL_PAGE,
                  arguments: movie,
                ),
                child: Stack(
                  children: [
                    // Exibe a imagem do filme com bordas arredondadas.
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: SizedBox(
                        height: 300,
                        width: 200,
                        // Verifica se o caminho da imagem do filme está vazio.
                        child: movie.posterPath == ""
                            // Se estiver vazio, exibe uma imagem de erro padrão.
                            ? Image.network(
                                Constants.imageError,
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              )
                            // Se não estiver vazio, exibe a imagem do filme.
                            : Image.network(
                                '${Constants.imagePath}${snapshot.data[itemIndex].posterPath}',
                                filterQuality: FilterQuality.high,
                                fit: BoxFit.cover,
                              ),
                      ),
                    ),
                  ],
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
