

import 'package:cinemapedia/domain/entities/actor.dart';

/*
Lista de datasources referenciando a la informacion con respecto a los Actores
!Se debe de tener la misma cantidad de repositories y de darasources
*/ 


abstract class ActorsDatasource {
  Future<List<Actor>> getActorsByMovie(String moveId);
}


