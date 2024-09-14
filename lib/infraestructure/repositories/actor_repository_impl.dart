





import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/repositories/actors_repository.dart';

import '../../domain/entities/actor.dart';

/*
*Implementacion de los datasources declarados
*Por eso ActorRepositoryImpl se extiende de ActorsRepository
*/ 


class ActorRepositoryImpl extends ActorsRepository{

  final ActorsDatasource datasource;
  ActorRepositoryImpl(this.datasource);
  
  @override
  Future<List<Actor>> getActorsByMovie(String moveId) {
    return datasource.getActorsByMovie(moveId);
  }

}