



import 'package:cinemapedia/infraestructure/datasources/actor_moviedb_datasource.dart';
import 'package:cinemapedia/infraestructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/*
*Se usa este repositorio para retornar la informacion con respecto a los actores con el uso del 
*riverpood, el ActorRepository y el ActoMovieDatarouse 
*Este repositorio es inmutable
*/
final actorsRepositoryProvider = Provider((ref){
  return ActorRepositoryImpl(ActorMoviedbDatasource());
});
