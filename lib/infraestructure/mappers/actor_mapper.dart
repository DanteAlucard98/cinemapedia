import 'package:cinemapedia/domain/entities/actor.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/credits_response.dart';



/*
  *El mapper nos sirve para poder serciorarnos de que si en alun dato es null, lo podamos remplazar
  *ademas de que nos va a servir bastante para los cambios de los end points o de la base
*/ 


class ActorMapper {
  static Actor castToEntity(Cast cast) =>
  Actor(
    id: cast.id, 
    name: cast.name, 
    profilePath: cast.profilePath != null
    ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
    : 'https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png', 
    character: cast.character
    );
}