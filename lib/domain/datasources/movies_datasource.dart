

import 'package:cinemapedia/domain/entities/movie.dart';

/*
  Lista de Datasource referenciando a la informacion con respecto a las peliculas
  !Se debe de tener la misma cantidad de repositories y de darasources
*/
abstract class MoviesDatasource {
  Future<List<Movie>> getNowPlaying({int page=1});

  Future<List<Movie>> getPopular({int page=1});

  Future<List<Movie>> getUpcoming({int page=1});

  Future<List<Movie>> getTopRated({int page=1});

  Future<Movie> getMovieById(String id);

}