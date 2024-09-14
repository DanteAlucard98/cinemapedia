
/*
  Entity con respecto a la informacion de los Actores
 ! Se debe de tener cuidado con los datos que pueden ser null
*/ 


class Actor {
  final int id;
  final String name;
  final String profilePath;
  final String? character;

  Actor({
    required this.id,
    required this.name,
    required this.profilePath,
    required this.character,
  });
}
