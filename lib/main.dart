import 'package:flutter/material.dart';
import 'package:projeto_trendx/models/change_theme.dart';
import 'package:projeto_trendx/models/movie.dart';
import 'package:projeto_trendx/models/movie_list.dart';
import 'package:projeto_trendx/pages/detail_page.dart';
import 'package:projeto_trendx/pages/tabs_screen.dart';
import 'package:projeto_trendx/utils/routes.dart';
import 'package:projeto_trendx/utils/theme_config.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MovieList()), // Provedor para o modelo de lista de filmes.
        ChangeNotifierProvider(create: (_) => MovieFactory.createMovie()), // Provedor para a criação de instância de filme.
        ChangeNotifierProvider(create: (_) => ChangeTheme()), // Provedor para o modelo de alteração de tema.
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Obtém a instância do modelo de alteração de tema.
    final changeTheme = Provider.of<ChangeTheme>(context);


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      themeMode: ThemeMode.system,
      builder: (context, child) {
        return Theme(
          // Aplica o tema com base no modo escuro ou claro.
          data: changeTheme.isDarkMode
              ? ThemeConfig.darkTheme
              : ThemeConfig.lightTheme,
          child: child!,
        );
      },
      routes: {
        // Rotas da aplicação.
        AppRoutes.HOME: (ctx) => const TabsScreen(),
        AppRoutes.DETAIL_PAGE: (ctx) => const DetailPage(),
      },
    );
  }
}
