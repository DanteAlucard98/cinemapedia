import 'package:cinemapedia/domain/entities/movie.dart';

/*

*Lista de repositories con respecto a los actores
!Se debe de tener la misma cantidad de repositories y de darasources
*/


abstract class MoviesRepository {
  Future<List<Movie>> getNowPlaying({int page=1});

  Future<List<Movie>> getPopular({int page=1});

  Future<List<Movie>> getUpcoming({int page=1});

  Future<List<Movie>> getTopRated({int page=1});

  Future<Movie> getMovieById(String id);
}