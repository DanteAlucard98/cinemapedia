import 'package:flutter_dotenv/flutter_dotenv.dart';

/*
Class en donde se declaran las variables de entorno
y utilizarlas para el proyecto
*/

class Environment {
  static String theMovieDbKey = dotenv.env['THE_MOVIEDB_KEY'] ?? 'No hay api key';
}