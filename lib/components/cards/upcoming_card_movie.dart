import 'package:flutter/material.dart';
import 'package:projeto_trendx/utils/constants.dart';
import 'package:projeto_trendx/utils/routes.dart';

class UpComingCard extends StatelessWidget {
  final AsyncSnapshot snapshot;

  // Construtor que recebe um snapshot contendo dados assíncronos.
  const UpComingCard({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Título da seção.
        Text('Upcoming movies', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 32),
        // Lista horizontal de lançamentos.
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
              // Retorna um GestureDetector que navega para a página de detalhes ao tocar no filme.
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () => Navigator.of(context)
                      .pushNamed(AppRoutes.DETAIL_PAGE, arguments: movie),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.6,
                      height: MediaQuery.of(context).size.height * 0.3,
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
                ),
              );
            },
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }
}
