import 'package:cinemapedia/domain/entities/actor.dart';

/*

*Lista de repositories con respecto a los actores
!Se debe de tener la misma cantidad de repositories y de darasources

*/

abstract class ActorsRepository {
  Future<List<Actor>> getActorsByMovie(String moveId);
}