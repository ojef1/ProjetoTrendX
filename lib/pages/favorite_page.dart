import 'package:flutter/material.dart';
import 'package:projeto_trendx/components/lists/favorite_movie_list.dart';

class FavoritePage extends StatelessWidget {
  const FavoritePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'Favorite movies',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
      ),
      // Corpo da página contendo a lista de filmes favoritos
      body: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10),
          Expanded(child: FavoriteMovies())
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
