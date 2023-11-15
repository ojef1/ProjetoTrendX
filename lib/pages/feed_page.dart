import 'package:flutter/material.dart';
import 'package:projeto_trendx/components/lists/list_movies.dart';
import 'package:projeto_trendx/models/change_theme.dart';
import 'package:provider/provider.dart';

class FeedPage extends StatelessWidget {
  const FeedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'TrendX Movies',
          style: Theme.of(context).appBarTheme.titleTextStyle,
        ),
        actions: [
          // Ícone de alternação de tema (escuro/claro)
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: Consumer<ChangeTheme>(
              builder: (context, changeTheme, child) {
                return IconButton(
                  icon: Icon(
                    // Alterna entre os ícones de luz e escuro com base no modo atual
                    changeTheme.isDarkMode
                        ? Icons.light_mode_rounded
                        : Icons.dark_mode_rounded,
                    // Define a cor do ícone com base no modo atual
                    color: changeTheme.isDarkMode ? Colors.white : Colors.black,
                  ),
                  //altera o estado do tema ao ser pressionado
                  onPressed: () => changeTheme.toggleTheme(),
                );
              },
            ),
          ),
        ],
      ),
      // Corpo da página contendo a lista de filmes
      body: const ListMovies(),
      backgroundColor: Theme.of(context).colorScheme.primary,
    );
  }
}
