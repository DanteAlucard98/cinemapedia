


import 'package:cinemapedia/infraestructure/datasources/moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/movie_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/*
*Se usa este repositorio para retornar la informacion con respecto a las peliculas con el uso del 
*riverpood, el MovieRepository y el MoviedbDatasurce 
*Este repositorio es inmutable
*/

final movieRepositoryProvider = Provider((ref){
  return MovieRepositoryImpl(MoviedbDatasurce());
});


