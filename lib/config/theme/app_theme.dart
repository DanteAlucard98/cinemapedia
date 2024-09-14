import 'package:flutter/material.dart';



/*
*Apptheme nos sirve para los temas que nos brinda el Material 3 y los colores para
*los widgets que se estan utilizando
*/ 

class AppTheme{

  ThemeData getTheme() => ThemeData(
    useMaterial3:true,
    colorSchemeSeed: const Color(0xFF2862F5)
  );
}