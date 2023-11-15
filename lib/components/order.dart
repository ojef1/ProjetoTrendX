import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:projeto_trendx/models/movie_list.dart';

class Order extends StatelessWidget {
  const Order({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Obtém uma instância do MovieList do Provider.
    final MovieList movieList = Provider.of<MovieList>(context);

    // Retorna uma linha contendo dois ChoiceChips para ordenação.
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // ChoiceChip para ordenar por título.
        _buildChoiceChip(
          "A - Z",
          movieList,
          movieList.sortMoviesByTitle,
          const BorderRadius.only(
            bottomLeft: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
          context,
        ),
        // ChoiceChip para ordenar por ano de lançamento.
        _buildChoiceChip(
          "Ano de lançamento",
          movieList,
          movieList.sortMoviesByRelease,
          const BorderRadius.only(
            bottomRight: Radius.circular(10),
            topRight: Radius.circular(10),
          ),
          context,
        ),
      ],
    );
  }

  // Função privada para construir um ChoiceChip personalizado.
  Widget _buildChoiceChip(String label, MovieList movieList, Function() onTap,
      BorderRadius borderRadius, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20),
      child: InkWell(
        onTap: () {
          onTap();
        },
        child: Ink(
          width: 150,
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          decoration: BoxDecoration(
              color: label == movieList.order
                  ? Theme.of(context).colorScheme.secondary
                  : Theme.of(context).colorScheme.primary,
              borderRadius: borderRadius),
          child: Text(
            textAlign: TextAlign.center,
            label,
            style: TextStyle(
              color: movieList.order == label
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondary,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
