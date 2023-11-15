import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:projeto_trendx/pages/favorite_page.dart';
import 'package:projeto_trendx/pages/feed_page.dart';
import 'package:projeto_trendx/pages/searchPage.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedScreenIndex = 0; //valor inicial, que indica abrir na primeira tela.
  late List<Map<String, Object>> _screens; // cria um mapa de telas que será iniciada posteriormente.

  @override
  void initState() {
    super.initState();
    // Lista de páginas a serem exibidas nas guias.
    _screens = [
      {"screen": const FeedPage()},
      {"screen": const MovieSearchScreen()},
      {"screen": const FavoritePage()},
    ];
  }

  // função para alteraro index da tela selecionada conforme a navegação.
  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedScreenIndex]['screen'] as Widget, // a tela será apresentada conforme o index de screens.

      //barra responsável por fazer a navegação.
      bottomNavigationBar: CurvedNavigationBar(
        height: MediaQuery.of(context).size.height * 0.07,
        buttonBackgroundColor: Theme.of(context).colorScheme.secondary,
        animationDuration: const Duration(milliseconds: 350),
        backgroundColor: Colors.transparent,
        color: Theme.of(context).colorScheme.secondary,
        onTap: (index) => _selectScreen(index),
        items: [
          Icon(Icons.home, color: Theme.of(context).colorScheme.primary),
          Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
          Icon(Icons.bookmark, color: Theme.of(context).colorScheme.primary),
        ],
      ),
    );
  }
}
