


import 'package:cinemapedia/constants/environment.dart';
import 'package:cinemapedia/domain/datasources/movies_datasource.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/infraestructure/mappers/movie_mapper.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/movie_details.dart';
import 'package:cinemapedia/infraestructure/models/moviedb/moviedb_response.dart';
import 'package:dio/dio.dart';

class MoviedbDatasurce extends MoviesDatasource{

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
    *Conversion de json a dart
    */ 
    List<Movie> _jsonToMovies(Map<String,dynamic>json){
      final movieDBResponse = MovieDbResponse.fromJson(json);

    final List<Movie> movies = movieDBResponse.results
    .where((moviedb) => moviedb.posterPath != 'no-poster')
    .map((moviedb) => MovieMapper.movieDBToEntity(moviedb)
    ).toList() ;

    return movies;
    }

  /*
    *Obtencion de las peliculas que estan en el cine
  */ 
  @override
  Future<List<Movie>> getNowPlaying({int page = 1}) async {

    final response = await dio.get('/movie/now_playing',
      queryParameters: {
        'page':page
      }
    );
    
    return _jsonToMovies(response.data);
  }

  /*
    *Obtencion de las peliculas que son populares
  */ 
  
  @override
  Future<List<Movie>> getPopular({int page = 1}) async {
     final response = await dio.get('/movie/popular',
      queryParameters: {
        'page':page
      }
    );
    

    return _jsonToMovies(response.data);
  }
  
  /*
    *Obtencion de las peliculas que son las mejores calificadas
  */ 

  @override
  Future<List<Movie>> getTopRated({int page = 1}) async {
    final response = await dio.get('/movie/top_rated',
      queryParameters: {
        'page':page
      }
    );
    

    return _jsonToMovies(response.data);
  }
  
  /*
    *Obtencion de las peliculas que se van a estrenar
  */ 

  @override
  Future<List<Movie>> getUpcoming({int page = 1}) async {
    final response = await dio.get('/movie/upcoming',
      queryParameters: {
        'page':page
      }
    );
    

    return _jsonToMovies(response.data);
  }
  
  /*
    *Obtencion de informacion de una pelicula en especifico
  */ 

  @override
  Future<Movie> getMovieById(String id) async {
    final response = await dio.get('/movie/$id');
      if (response.statusCode != 200) throw Exception('Movie with id: $id not found');
      final movieDetails = MovieDetails.fromJson(response.data);
      final Movie movie = MovieMapper.movieDetailsToEntity(movieDetails);
    
    return movie ;
  }
  
}