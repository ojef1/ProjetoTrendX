import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:projeto_trendx/models/movie_list.dart';
import 'package:provider/provider.dart';

class SearchBarWidget extends StatefulWidget {
  SearchBarWidget({super.key});

  @override
  State<SearchBarWidget> createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Obtém uma instância do MovieList do Provider.
    final MovieList movieList = Provider.of<MovieList>(context);

    // Função para realizar a pesquisa de filmes.
    void search() async {
      final String query = _searchController.text;
      if (query.isNotEmpty) {
        await movieList.searchMovies(query);
      }
    }

    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: AnimSearchBar(
        // Configurações visuais da barra de pesquisa animada.
        animationDurationInMilli: 500,
        color: Theme.of(context).colorScheme.secondary,
        searchIconColor: Theme.of(context).colorScheme.primary,
        textFieldIconColor: Theme.of(context).colorScheme.primary,
        boxShadow: true,
        textFieldColor: Theme.of(context).colorScheme.secondary,
        closeSearchOnSuffixTap: true,
        autoFocus: true,
        style: TextStyle(
          color: Theme.of(context).colorScheme.primary,
          fontSize: 20,
        ),
        width: MediaQuery.of(context).size.width * 0.95,
        rtl: true,
        textController: _searchController,
        // Limpa o campo de pesquisa ao tocar no ícone de fechar.
        onSuffixTap: () {
          setState(() {
            _searchController.clear();
          });
        },
         // Executa a pesquisa quando o usuário submete o formulário.
        onSubmitted: (_) => search(),
      ),
    );
  }
}
