import 'package:flutter/foundation.dart';

import 'package:flutter/material.dart';


import 'css_colors.dart';


class ColorManager {

  static Color transparent = Colors.transparent;

  static const Color primary = Color.fromRGBO(9, 171, 142, 1);

  static Color darkGrey = const Color(0xff525252);

  static Color grey = const Color(0xff737477);

  static const Color lightGrey = Color(0xff9E9E9E);


  // new colors

  static const Color darkPrimary = Color(0xff005782);

  static Color mediumDarkPrimary = const Color(0xff005782);

  static Color lightPrimary = const Color(0xff005782);

  static Color selectedNavBarItem = const Color(0xff389be8);

  static Color lightBlue = const Color(0xFF90CAF9);

  static Color blue = const Color(0xff2C8BFF);

  static Color darkBlue = const Color(0xFF1976D2);

  static Color darkestBlue = const Color.fromRGBO(4, 27, 70, 1.0);

  static const Color darkGreen = Color(0xFF2B9D0D);

  static const Color green = Color(0xFF2BB405);

  static const Color greenSuccess = Color(0xFF35D708);


  // color with 80% opacity

  static Color grey1 = const Color(0xff616165);

  static Color grey2 = const Color(0xff797979);

  static const Color whitePrimary = Color(0xffd5d5d5);

  static const Color white = Color(0xffFFFFFF);

  static const Color whiteLight = Color(0xfff3f7ff);

  static const Color white70 = Colors.white70;


  static Color black = const Color(0xff000000);

  static Color blackLight = const Color(0xff423e3e);

  static Color yellow = const Color(0xfffff200);

  static const Color amber = Color(0xffd9cd0b);

  static Color lightOrange = const Color(0xFFFFCC80);

  static Color darkOrange = const Color(0xFFFFA000);


  static const Color errorDarkOrange = Color(0xffff4400); // red color

  static const Color error = Color(0xffe61f34); // red color

  static Color red = const Color(0xfffd1010); // red color


  static Color getProgressBarColor(
      {Color startColor = error,
      Color mediumColor = amber,
      Color endColor = greenSuccess,
      required double currentVoteRatio}) {

    assert(currentVoteRatio >= 0.0 && currentVoteRatio <= 1.0);


    if (currentVoteRatio <= 0.5) {

      // Scale ratio from [0, 0.5] to [0, 1] for the first phase

      double scaledRatio = currentVoteRatio * 2.0;

      return Color.lerp(startColor, mediumColor, scaledRatio)!;

    } else {

      // Scale ratio from [0.5, 1] to [0, 1] for the second phase

      double scaledRatio = (currentVoteRatio - 0.5) * 2.0;

      return Color.lerp(mediumColor, endColor, scaledRatio)!;

    }

    // Interpolate color based on current progress

    // return Color.lerp(startColor, endColor, currentVoteRatio)!;

  }


  static Color gradientColorForLevel(int level,

      {Color startColor = primary, Color endColor = greenSuccess}) {

    // Define a range for the gradient before it starts inverting

    const int range = 10;


    // Calculate the effective level for repeating gradients after every `range * 2` levels

    // This creates a sawtooth wave effect for the color transition

    int effectiveLevel = level % (range * 2);

    if (effectiveLevel >= range) {

      // Invert the gradient for the second half of the range

      effectiveLevel = range - (effectiveLevel % range);

    }


    // Calculate the color for the current level

    double ratio = effectiveLevel / (range - 1);

    return Color.lerp(startColor, endColor, ratio)!;

  }


  // Gradients Colors


  static const List<Color> backgroundColorDark = [

    Color.fromRGBO(54, 54, 54, 1.0),

    Color.fromRGBO(45, 45, 45, 1.0),

    Color.fromRGBO(31, 31, 31, 1.0),

    Color.fromRGBO(17, 17, 17, 1.0),

  ];


  static const List<Color> actionContainerColorDarkBlue = [

    // Color.fromRGBO(47, 75, 110, 1),

    // Color.fromRGBO(22, 57, 100, 1.0),

    // Color.fromRGBO(81, 121, 22, 1.0),

    Color.fromRGBO(4, 27, 70, 1.0),

    Color.fromRGBO(3, 17, 42, 1.0),

  ];


  // static const List<Color> blackMask = [

  //   // Color.fromRGBO(47, 75, 110, 1),

  //   // Color.fromRGBO(22, 57, 100, 1.0),

  //   // Color.fromRGBO(81, 121, 22, 1.0),

  //   Color.fromRGBO(4, 27, 70, 1.0),

  //   Color.fromRGBO(3, 17, 42, 1.0),

  // ];


  static const List<Color> backgroundSeries = [

    Color.fromRGBO(34, 58, 90, 1.0),

    Color.fromRGBO(0, 18, 42, 1.0),

  ];


  static const List<Color> searchBarColor = [

    Color(0xff4e6581),

    Color(0xff6086ab),

  ];


  static const List<Color> borderSearchBarColor = [

    Color(0xff4c5f7b),

    Color(0xff50a5e4),

  ];


  // static const List<Color> actionContainerColorBlue = [

  //   Color.fromRGBO(63, 124, 190, 1.0),

  //   Color(0xff005782),

  //   Color.fromRGBO(63, 135, 208, 1.0),

  //   Color.fromRGBO(4, 42, 88, 1.0),

  // ];

  static const List<Color> actionContainerColorBlue = [

    Color.fromRGBO(63, 124, 190, 1.0),

    primary,

    Color.fromRGBO(63, 135, 208, 1.0),

    darkPrimary,

  ];


  // static const List<Color> backgroundColorLight = [

  //   Color.fromRGBO(255, 255, 255, 1.0),

  //   Color.fromRGBO(241, 241, 241, 1),

  //   Color.fromRGBO(233, 233, 233, 1),

  //   Color.fromRGBO(222, 222, 222, 1),

  // ];


  static Map<int, Color> backgroundColorLight = <int, Color>{

    50: const Color(0xffffffff),

    100: const Color(0xfff3f3f3),

    200: const Color(0xffeaeaea),

    300: const Color(0xffe0e0e0),

    400: const Color(0xffd5d5d5),

    500: const Color(0xffcccccc),

    600: const Color(0xffbdbdbd),

    700: const Color(0xffafd5f5),

    800: const Color(0xff94cfff),

    900: const Color(0xff84c4f8),

  };


// Define the list of colors you want to use for your grid items

  static final List<Color> dashboardItemColors = [

    Colors.deepOrange,

    Colors.green,

    Colors.purple,

    Colors.brown,

    Colors.indigo,

    Colors.teal,

    Colors.blue,

    Colors.pinkAccent,

    Colors.amber,

    Colors.cyan,

    Colors.lime,

    Colors.lightGreen,

    Colors.deepPurple,

    Colors.orange,

    Colors.blueGrey,

    Colors.red,

    Colors.yellow,

    Colors.lightBlueAccent,

    Colors.pink,

    Colors.cyanAccent,

    Colors.amberAccent,

    Colors.deepPurpleAccent,

    Colors.orangeAccent,

    Colors.blueAccent,

    Colors.redAccent,

    Colors.greenAccent,

    Colors.yellowAccent,

    Colors.purpleAccent,

    Colors.limeAccent,

    Colors.tealAccent,

  ];


  static final List<Color> dashboardLevelsColors = [

    const Color(0xFF6A1B9A), // Deep purple

    const Color(0xFF9C27B0), // Purple

    const Color(0xFFAB47BC), // Purple Accent

    const Color(0xFFE91E63), // Pink

    const Color(0xFFFF4081), // Pink Accent

    const Color(0xFFFF5252), // Red Accent

    const Color(0xFFF44336), // Red

    const Color(0xFFFF7043), // Deep Orange Accent

    const Color(0xFFFF9800), // Orange

    const Color(0xFFFFC107), // Amber

    const Color(0xFFFFD54F), // Amber Accent

    const Color(0xFFFFEB3B), // Yellow

    const Color(0xFFFFFF00), // Yellow Accent

    const Color(0xFFCDDC39), // Lime

    const Color(0xFFAFB42B), // Lime Accent

    const Color(0xFF8BC34A), // Light Green

    const Color(0xFF7CB342), // Light Green Accent

    const Color(0xFF4CAF50), // Green

    const Color(0xFF2E7D32), // Green Accent

    const Color(0xFF009688), // Teal

  ];


  static Map<int, Color> blueMainTheme = <int, Color>{

    50: const Color(0xff005782),

    100: const Color(0xff005782),

    200: const Color(0xff005782),

    300: const Color(0xff005782),

    400: const Color(0xff005782),

    500: const Color(0xff005782),

    600: const Color(0xff005782),

    700: const Color(0xff005782),

    800: const Color(0xff005782),

    900: const Color(0xff005782),

  };


  /*static Color hexToColor(String code) {
    return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
  }*/


  static Color hexToColor(String code) {

    if (CssColors.colors.containsKey(code.toLowerCase())) {

      return CssColors.colors[code.toLowerCase()]!;

    } else if (code.isEmpty || code.length < 7) {

      // You might want to return a default color here instead of throwing an error

      if (kDebugMode) {

        print('Invalid color code: $code');

      }

      return ColorManager.white70;

    }


    try {

      return Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);

    } catch (e) {

      // If the parsing fails (e.g., due to an invalid code), an error will be thrown

      // You can handle this error by returning a default color

      print('Failed to parse color code: $code. Error: $e');

      return const Color(0xFF000000); // This returns a black color as a default

    }

  }


  static Color getContrastingTextColor(Color backgroundColor) {

    // Calculate the luminance of the color.

    double luminance = backgroundColor.computeLuminance();


    // If the color is light, return black, otherwise return white.

    if (luminance > 0.5) {

      return ColorManager.darkestBlue;

    } else {

      return Colors.white;

    }

  }


  static final Map<int, Color> colorMapper = {

    0: Colors.white,

    1: Colors.blueGrey[50]!,

    2: Colors.blueGrey[100]!,

    3: Colors.blueGrey[200]!,

    4: Colors.blueGrey[300]!,

    5: Colors.blueGrey[400]!,

    6: Colors.blueGrey[500]!,

    7: Colors.blueGrey[600]!,

    8: Colors.blueGrey[700]!,

    9: Colors.blueGrey[800]!,

    10: Colors.blueGrey[900]!,

  };


// Define colors for each level

  static final List<Color> levelColors = [

    // const Color(0xff005782).withOpacity(0.1),

    // const Color(0xff005782).withOpacity(0.2),

    // const Color(0xff005782).withOpacity(0.3),

    // const Color(0xff005782).withOpacity(0.4),

    // const Color(0xff005782).withOpacity(0.5),


    Colors.blue.shade100,

    Colors.blue.shade300,

    // Colors.blue.shade500,

    // Colors.blue.shade300,

    // Colors.blue.shade400,

    // const Color(0xff005782).withOpacity(0.8),

    // const Color(0xff005782).withOpacity(0.95),


    // Colors.green.shade50,

    Colors.green.shade200,

    Colors.green.shade400,


    // Colors.red.shade50,

    Colors.red.shade100,

    Colors.red.shade300,


    // Colors.purple.shade50,

    Colors.purple.shade100,

    Colors.purple.shade300,


    Colors.indigo.shade50,

    Colors.indigo.shade100,

    // Colors.indigo.shade200,

    // Colors.indigo.shade300,


    // Colors.blue.shade300,

    // Colors.blue.shade400,

    // Colors.blue.shade500,

    //

    // Colors.amber.shade100,

    // Colors.amber.shade200,

    // Colors.amber.shade300,


    Colors.yellow.shade50,

    Colors.yellow.shade100,


    Colors.orange.shade50,

    Colors.orange.shade100,


    /// repeat

    Colors.blue.shade50,

    Colors.blue.shade100,


    Colors.green.shade50,

    Colors.green.shade100,


    Colors.red.shade50,

    Colors.red.shade100,


    Colors.purple.shade50,

    Colors.purple.shade100,


    Colors.indigo.shade50,

    Colors.indigo.shade100,


    Colors.yellow.shade50,

    Colors.yellow.shade100,


    Colors.orange.shade50,

    Colors.orange.shade100,


    /// repeat

    Colors.blue.shade50,

    Colors.blue.shade100,


    Colors.green.shade50,

    Colors.green.shade100,


    Colors.red.shade50,

    Colors.red.shade100,


    Colors.purple.shade50,

    Colors.purple.shade100,


    Colors.indigo.shade50,

    Colors.indigo.shade100,


    Colors.yellow.shade50,

    Colors.yellow.shade100,


    Colors.orange.shade50,

    Colors.orange.shade100,


    /// repeat

    Colors.blue.shade50,

    Colors.blue.shade100,


    Colors.green.shade50,

    Colors.green.shade100,


    Colors.red.shade50,

    Colors.red.shade100,


    Colors.purple.shade50,

    Colors.purple.shade100,


    Colors.indigo.shade50,

    Colors.indigo.shade100,


    Colors.yellow.shade50,

    Colors.yellow.shade100,


    Colors.orange.shade50,

    Colors.orange.shade100,

  ];

}


extension ColorUtil on Color {

  Color byLuminance() =>

      computeLuminance() > 0.4 ? Colors.black87 : Colors.white;

}

