import 'package:cinemapedia/presentation/providers/movies/movies_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';




final movieInfoProvider = StateNotifierProvider<MoviesMapNotifier,Map<String,Movie>>((ref){
  //*Se esta leyendo las peliculas del provider gracias al uso del riverpood por si se tiene algun cambio
  final movieRepository = ref.watch(movieRepositoryProvider);

  return MoviesMapNotifier(getMovie:movieRepository.getMovieById);
});


//*Para el manejo de el cache de la informacion obtenida de las peliculas

typedef GetMovieCallback = Future<Movie>Function(String movieId);

class MoviesMapNotifier extends StateNotifier<Map<String,Movie>>{
  final GetMovieCallback getMovie;
  MoviesMapNotifier({required this.getMovie}):super({});

  Future<void> loadMovie(String movieId) async {
    if(state[movieId] != null) return;
    final movie = await getMovie(movieId);
    state = {...state,movieId:movie};
  }
}