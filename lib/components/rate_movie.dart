import 'package:flutter/material.dart';
import 'package:projeto_trendx/models/movie.dart';

class RateMovie extends StatelessWidget {
  final Movie movie;
  const RateMovie({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
     // Container que exibe a avaliação do filme.
    return Container(
        width: MediaQuery.of(context).size.width * 0.22,
        padding: const EdgeInsets.all(6),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary,
            boxShadow: const [BoxShadow(color: Colors.black, blurRadius: 5)],
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Ícone de estrela para representar a avaliação.
            const Icon(
              Icons.star_rate_rounded,
              color: Colors.amber,
            ),
            // Texto que exibe a avaliação do filme.
            Text(
              movie.voteAverage.toStringAsFixed(1),
              style: Theme.of(context).textTheme.labelLarge,
            )
          ],
        ));
  }
}
