import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:projeto_trendx/components/rate_movie.dart';
import 'package:projeto_trendx/models/movie.dart';
import 'package:projeto_trendx/utils/constants.dart';
import 'package:projeto_trendx/utils/routes.dart';

class SearchedCard extends StatelessWidget {
  final List<Movie> movies;
  const SearchedCard({super.key, required this.movies});

  @override
  Widget build(BuildContext context) {
    // Retorna um widget CarouselSlider que exibe os filmes favoritos em um carrossel.
    return CarouselSlider.builder(
      itemCount: movies.length,
      options: CarouselOptions(
        // Configurações do carrossel para ajustar a aparência e o comportamento.
        height: MediaQuery.of(context).size.height * 0.6,
        viewportFraction: 0.75,
        enlargeCenterPage: true,
        autoPlayCurve: Curves.fastOutSlowIn,
        autoPlayAnimationDuration: const Duration(seconds: 2),
      ),
      itemBuilder: (context, itemIndex, pageViewIndex) {
        final Movie movie = movies[itemIndex];
        // Retorna um GestureDetector que navega para a página de detalhes ao tocar no filme.
        return GestureDetector(
          onTap: () => Navigator.of(context)
              .pushNamed(AppRoutes.DETAIL_PAGE, arguments: movie),
          // Exibe um widget Stack para sobrepor elementos.
          child: Stack(
            children: [
              // Exibe a imagem do filme com bordas arredondadas.
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.6,
                  width: MediaQuery.of(context).size.width * 0.8,
                  // Verifica se o caminho da imagem do filme está vazio.
                  child: movie.posterPath == ""
                      // Se estiver vazio, exibe uma imagem de erro padrão.
                      ? Image.network(
                          Constants.imageError,
                        )
                      // Se não estiver vazio, exibe a imagem do filme.
                      : Image.network(
                          '${Constants.imagePath}${movie.posterPath}',
                          filterQuality: FilterQuality.high,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
              // Exibe a classificação do filme na parte superior da imagem.
              RateMovie(movie: movie)
            ],
          ),
        );
      },
    );
  }
}
