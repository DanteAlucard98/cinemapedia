import 'package:cinemapedia/presentation/providers/providres.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



/*
*Estamos escuchando si la diferente informacion con respecto a las pelicula se esta cargando correctamente
*/ 

final initialLoadingProvider = Provider<bool>((ref) {

  final step1 = ref.watch(moviesSlideshowProvider).isEmpty;
    final step2 = ref.watch(popularMoviesProvider).isEmpty;
    final step3 = ref.watch(UpcomingMoviesProvider).isEmpty;
    final step4 = ref.watch(TopratedMoviesProvider).isEmpty;

    if(step1||step2||step3||step4) return true;

    return false;
});