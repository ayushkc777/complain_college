import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Splash', style: TextStyle(color: AppColors.textDark)),
      ),
    );
  }
}
