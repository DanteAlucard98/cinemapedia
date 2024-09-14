




import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final nowPlayingMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref){
  //*Se esta leyendo a las peliculas del provider getNowPlaying gracias al uso del riverpood si se tiene algun cambio

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getNowPlaying;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

final popularMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref){
    //*Se esta leyendo a las peliculas del provider getPopular gracias al uso del riverpood si se tiene algun cambio

  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getPopular;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

final UpcomingMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref){
  //*Se esta leyendo a las peliculas del provider getUpcoming gracias al uso del riverpood si se tiene algun cambio
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getUpcoming;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});


final TopratedMoviesProvider = StateNotifierProvider<MoviesNotifier,List<Movie>>((ref){
  //*Se esta leyendo a las peliculas del provider getTopRated gracias al uso del riverpood si se tiene algun cambio
  final fetchMoreMovies = ref.watch(movieRepositoryProvider).getTopRated;

  return MoviesNotifier(
    fetchMoreMovies: fetchMoreMovies
  );
});

typedef MovieCall = Future<List<Movie>> Function({int page});


/*
Se hace el proceso para la obtencion de mas peliculas (page)
para mostrarlas
*/ 

class MoviesNotifier extends StateNotifier<List<Movie>>{
  int currentPage = 0;
  bool isLoading = false;
  MovieCall fetchMoreMovies;
  MoviesNotifier({required this.fetchMoreMovies}):super([]);

  Future<void>loadNextPage() async{
    if (isLoading) return;
    isLoading = true;

    currentPage++;
    final List<Movie> movies = await fetchMoreMovies(page:currentPage);
    state = [...state,...movies];
    
    await Future.delayed(const Duration(milliseconds: 300));
    isLoading = false;
  }
}