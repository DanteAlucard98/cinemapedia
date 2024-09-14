import 'package:cinemapedia/presentation/providers/providres.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  //Ponemos un nombre a la pantalla
  static const name = 'home-screen';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: _HomeView(),
      //Se tiene botones para la parte inferior, toda via no tiene funcionalidad
      bottomNavigationBar: CustomBottomNavigation(),
    );
  }
}

class _HomeView extends ConsumerStatefulWidget {
  const _HomeView();
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<_HomeView> {
  @override
  void initState() {
    super.initState();
    //Cuando entramos a la pantalla cargamos la informacion de las peliculas en general
    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(UpcomingMoviesProvider.notifier).loadNextPage();
    ref.read(TopratedMoviesProvider.notifier).loadNextPage();
    
  }

  @override
  Widget build(BuildContext context) {

    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();
    /*
    *Si se cargo correctamente la informacion mostramos dicha informacion si no 
    *mostramos una pantalla de carga mandando diversos mensajes
    */
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final nowfewMovies = ref.watch(moviesSlideshowProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(UpcomingMoviesProvider);
    final topratedMovies = ref.watch(TopratedMoviesProvider);
    final DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);

    /*Es la visualizacion de la pantalla home*/ 
    return CustomScrollView(
      slivers: [

        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            
            return Column(
              children: [
                
                MoviesSlideshow(movies: nowfewMovies),
                //Peliculas en cines
                MovieHorizontalLisView(
                  movies: nowPlayingMovies,
                  title: 'En cines',
                  subtitle: formattedDate,
                  loadNextPage: () => ref
                      .read(nowPlayingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                //Peliculas que van a salir proximamente
                MovieHorizontalLisView(
                  movies: upcomingMovies,
                  title: 'Proximamente',
                  subtitle: 'En este mes',
                  loadNextPage: () => ref
                      .read(UpcomingMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                //Peliculas mas populares
                MovieHorizontalLisView(
                  movies: popularMovies,
                  title: 'Populares',
                  loadNextPage: () => ref
                      .read(popularMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                //Peliculas mejores calificadas
                MovieHorizontalLisView(
                  movies: topratedMovies,
                  title: 'Mejor calificadas',
                  subtitle: 'Desde siempre',
                  loadNextPage: () => ref
                      .read(TopratedMoviesProvider.notifier)
                      .loadNextPage(),
                ),
                const SizedBox(
                  height: 10,
                )
              ],
            );
          }, childCount: 1),
        ),
      ],
    );
  }
}
