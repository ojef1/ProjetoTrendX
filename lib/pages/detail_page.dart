import 'package:flutter/material.dart';
import 'package:projeto_trendx/components/detail_movie.dart';
import 'package:projeto_trendx/models/movie.dart';
import 'package:projeto_trendx/utils/constants.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Obter o filme passado como argumento para a página.
    final Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    // Obter o tamanho da tela.
    final mediaQuery = MediaQuery.of(context).size;
    // Definir alturas mínima e máxima para o painel deslizante.
    final minHeight = mediaQuery.height * 0.3;
    final maxHeight = mediaQuery.height * 0.9;

     // Usar ChangeNotifierProvider para permitir que a instância do Movie seja acessada pelos filhos.
    return ChangeNotifierProvider.value(
      value: movie,
      child: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          forceMaterialTransparency: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: [
            // Usar Consumer para reconstruir apenas o widget do ícone do favorito quando o estado muda.
            Consumer<Movie>(
              builder: (context, movie, child) => IconButton(
                onPressed: () {
                   // Alternar o estado de favorito ao pressionar o ícone.
                  movie.toggleFavorite(movie.id);
                },
                icon: Icon(
                  // Usar ícone de marcador de livro preenchido se for favorito, caso contrário, use o ícone de contorno.
                  movie.isFavorite
                      ? Icons.bookmark_rounded
                      : Icons.bookmark_outline,
                  color: movie.isFavorite ? Colors.amber : Colors.white,
                  size: 30,
                ),
              ),
            ),
          ],
        ),
        body: SlidingUpPanel(
          color: Theme.of(context).colorScheme.primary,
          minHeight: minHeight,
          maxHeight: maxHeight,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(40)),
          parallaxEnabled: true,
          parallaxOffset: .3,
          body: movie.posterPath == ""
              ? Image.network(
                  Constants.imageError,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                )
              : Image.network(
                  '${Constants.imagePath}${movie.posterPath}',
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.5,
                ),
          panelBuilder: (controller) => DetailMovie(controller: controller),
        ),
      ),
    );
  }
}
