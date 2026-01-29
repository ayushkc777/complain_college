import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:google_fonts/google_fonts.dart';

import 'utils/colors.dart';
import 'screens/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(
      builder: (context, orientation, screenType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Complain College',

          // Theme + Font (Sprint 2 requirement)
          themeMode: ThemeMode.system,
          theme: ThemeData(
            useMaterial3: true,
            scaffoldBackgroundColor: AppColors.bgWhite,
            colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primaryBlue),
            textTheme: GoogleFonts.poppinsTextTheme().apply(
              bodyColor: AppColors.textDark,
              displayColor: AppColors.textDark,
            ),
            appBarTheme: const AppBarTheme(
              backgroundColor: AppColors.bgWhite,
              foregroundColor: AppColors.textDark,
              elevation: 0,
            ),
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: AppColors.primaryBlue,
              brightness: Brightness.dark,
            ),
            textTheme: GoogleFonts.poppinsTextTheme(),
          ),

          home: const SplashScreen(),
        );
      },
    );
  }
}
