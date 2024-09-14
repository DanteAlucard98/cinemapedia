import 'package:flutter/material.dart';

/*
Barra de navegacion que se ve en la parte inferior de la pantalla home screen

*/

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max),
          label: 'Inicio'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.label_outline),
          label: 'Categorias'
          ),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_outline),
          label: 'Favoritos'
          ),
      ],
    );
  }
}