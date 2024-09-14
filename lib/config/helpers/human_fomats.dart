import 'package:intl/intl.dart';


/*
*Clase en donde se covierten los valores enteros grandes y los simplifica 
eg. 100,000 -> 100K 
*/ 

class HumanFormats {

  static String number(double number){
    final formattedNumber = NumberFormat.compactCurrency(
      decimalDigits: 0,
      symbol: '',
      locale: 'en'
    ).format(number);

    return formattedNumber;
  }
}