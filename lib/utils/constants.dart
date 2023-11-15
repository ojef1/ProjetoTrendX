// Classe que contém constantes utilizadas no aplicativo.
class Constants {
  // Chave de API fornecida pelo serviço TMDB (The Movie Database).
  static const apiKey = '1a870dfa8c225e1584b7a06be319c28a';

  // URL base para requisições à API do TMDB.
  static const baseUrl = 'https://api.themoviedb.org/3';

  // Caminho base para as imagens dos filmes.
  static const imagePath = 'https://image.tmdb.org/t/p/w500';

  // URL de uma imagem de erro/placeholder para exibir quando a imagem do filme não está disponível.
  static const imageError =
      'http://www.almostrandomtheatre.co.uk/wp-content/themes/news-code/assets/img/placeholder.jpg';

  // URL para obter os filmes mais bem avaliados.
  static const topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';

  // URL para obter os filmes que serão lançados em breve.
  static const upComingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';

  // URL para obter os filmes em tendência no dia.
  static const trendingUrl =
      'https://api.themoviedb.org/3/trending/movie/day?api_key=${Constants.apiKey}';

  // URL para realizar pesquisas de filmes na API.
  static const searchUrl = 'https://api.themoviedb.org/3/search/movie';
}
