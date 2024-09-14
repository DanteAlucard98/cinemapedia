


import 'package:cinemapedia/domain/datasources/actors_datasource.dart';
import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/mappers/actor_mapper.dart';
import 'package:dio/dio.dart';

import '../../constants/environment.dart';
import '../models/moviedb/credits_response.dart';

class ActorMoviedbDatasource extends ActorsDatasource{

  /*
  *Dio se utiliza comunmente para las peticiones Http, ademas de que nos facilita con respecto a las configuraciones y parametros
  */ 
  final dio= Dio(BaseOptions(
    baseUrl: 'https://api.themoviedb.org/3',
    queryParameters: {
      'api_key':Environment.theMovieDbKey,
      'lenguage': 'es-MX'
    }
    ));


  /*
  *Obtencion de la informacion con respecto a los actores
  */ 

  @override
  Future<List<Actor>> getActorsByMovie(String moveId) async{
    final response = await dio.get('/movie/$moveId/credits');
    final castResponse = CreditsResponse.fromJson(response.data);
    final List<Actor> actors = castResponse.cast
    .map((cast) => ActorMapper.castToEntity(cast)
    ).toList() ;
    
    return actors;
  }
}