import 'package:cinemapedia/presentation/providers/actors/actors_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../domain/entities/actor.dart';

final actorByMovieProvider = StateNotifierProvider<ActorByMovieNotifier,Map<String,List<Actor>>>((ref){
  //*Se esta leyendo los actores del provider gracias al uso del riverpood si se tiene algun cambio
  final actorRepository = ref.watch(actorsRepositoryProvider);

  return ActorByMovieNotifier(getActors:actorRepository.getActorsByMovie);
});


//*Para el manejo de el cache de la informacion obtenida de los actores
typedef GetActorsCallback = Future<List<Actor>>Function(String movieId);

class ActorByMovieNotifier extends StateNotifier<Map<String,List<Actor>>>{
  final GetActorsCallback getActors;
  ActorByMovieNotifier({required this.getActors}):super({});

  Future<void> loadActors(String movieId) async {
    if(state[movieId] != null) return;
    final List<Actor> actors = await getActors(movieId);
    state = {...state,movieId:actors};
  }
}