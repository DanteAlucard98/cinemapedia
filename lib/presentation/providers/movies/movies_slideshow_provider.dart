import 'package:cinemapedia/presentation/providers/movies/movies_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entities/movie.dart';

/*
*Se usa este repositorio para retornar la informacion con respecto a las peliculas pero con
*el uso solamente de las peliculas actuales que esta en cines para mostrar las primeras 7 peliculas para primer carrusel
*/


final moviesSlideshowProvider = Provider<List<Movie>>((ref){
  
  final nowPLayingMovies = ref.watch(nowPlayingMoviesProvider);

  if(nowPLayingMovies.isEmpty) return [];

  return nowPLayingMovies.sublist(0,6);

});