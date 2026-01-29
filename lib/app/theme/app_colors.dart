import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors - Blue Theme
  static const Color primary = Color(0xFF1E88E5);
  static const Color primaryDark = Color(0xFF1565C0);
  static const Color primaryLight = Color(0xFF64B5F6);

  // Secondary Colors
  static const Color secondary = Color(0xFF42A5F5);
  static const Color secondaryLight = Color(0xFF90CAF9);

  // Accent Colors
  static const Color accent1 = Color(0xFF4FC3F7);
  static const Color accent2 = Color(0xFF29B6F6);
  static const Color accent3 = Color(0xFF81D4FA);

  // Neutral Colors
  static const Color background = Color(0xFFF8F9FE);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceVariant = Color(0xFFF5F6FA);
  static const Color inputFill = Color(0xFFF5F5F5);

  // Text Colors
  static const Color textPrimary = Color(0xFF2D3142);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textDark = Color(0xFF212121);
  static const Color textMuted = Color(0xFF757575);

  // Border & Divider
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFEFF0F6);

  // Status Colors
  static const Color success = Color(0xFF4CAF50);
  static const Color warning = Color(0xFFFFA726);
  static const Color error = Color(0xFFEF4444);
  static const Color info = Color(0xFF3B82F6);

  // Login/Auth Colors (Blue theme)
  static const Color authPrimary = Color(0xFF2196F3);

  // Item Status Colors
  static const Color lostColor = Color(0xFF1E88E5);
  static const Color foundColor = Color(0xFF0D47A1);
  static const Color claimedColor = Color(0xFF9E9E9E);

  // Onboarding Colors
  static const Color onboarding1Primary = Color(0xFF1E88E5);
  static const Color onboarding1Secondary = Color(0xFF42A5F5);
  static const Color onboarding2Primary = Color(0xFF1976D2);
  static const Color onboarding2Secondary = Color(0xFF64B5F6);
  static const Color onboarding3Primary = Color(0xFF0D47A1);
  static const Color onboarding3Secondary = Color(0xFF1565C0);

  // White with opacity
  static const Color white90 = Color(0xE6FFFFFF);
  static const Color white80 = Color(0xCCFFFFFF);
  static const Color white50 = Color(0x80FFFFFF);
  static const Color white30 = Color(0x4DFFFFFF);
  static const Color white20 = Color(0x33FFFFFF);

  // Black with opacity
  static const Color black20 = Color(0x33000000);

  // Text secondary with opacity
  static const Color textSecondary60 = Color(0x996B7280);
  static const Color textSecondary50 = Color(0x806B7280);

  // Item Status Gradients
  static const LinearGradient lostGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
  );

  static const LinearGradient foundGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1976D2), Color(0xFF0D47A1)],
  );

  // Gradient Colors
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1E88E5), Color(0xFF1565C0)],
  );

  static const LinearGradient secondaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF42A5F5), Color(0xFF90CAF9)],
  );

  static const LinearGradient accentGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF4FC3F7), Color(0xFF81D4FA)],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF8F9FE), Color(0xFFFFFFFF)],
  );

  // Onboarding Gradients
  static const LinearGradient onboarding1Gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [onboarding1Primary, onboarding1Secondary],
  );

  static const LinearGradient onboarding2Gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [onboarding2Primary, onboarding2Secondary],
  );

  static const LinearGradient onboarding3Gradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [onboarding3Primary, onboarding3Secondary],
  );

  // Dark Theme Colors
  static const Color darkBackground = Color(0xFF0F1419);
  static const Color darkSurface = Color(0xFF1A1F26);
  static const Color darkSurfaceVariant = Color(0xFF242A32);
  static const Color darkInputFill = Color(0xFF1E242C);

  // Dark Text Colors
  static const Color darkTextPrimary = Color(0xFFE8EAED);
  static const Color darkTextSecondary = Color(0xFFB4B8BB);
  static const Color darkTextTertiary = Color(0xFF7C8186);

  // Dark Border & Divider
  static const Color darkBorder = Color(0xFF2D3339);
  static const Color darkDivider = Color(0xFF252B33);

  // Shadows
  static const List<BoxShadow> cardShadow = [
    BoxShadow(color: Color(0x141E88E5), blurRadius: 24, offset: Offset(0, 8)),
  ];

  static const List<BoxShadow> buttonShadow = [
    BoxShadow(color: Color(0x401E88E5), blurRadius: 16, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> softShadow = [
    BoxShadow(color: Color(0x0A000000), blurRadius: 12, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> elevatedShadow = [
    BoxShadow(color: black20, blurRadius: 30, offset: Offset(0, 15)),
    BoxShadow(color: white30, blurRadius: 20, offset: Offset(0, 5)),
  ];

  // Dark Theme Shadows
  static const List<BoxShadow> darkCardShadow = [
    BoxShadow(color: Color(0x26000000), blurRadius: 24, offset: Offset(0, 8)),
  ];

  static const List<BoxShadow> darkSoftShadow = [
    BoxShadow(color: Color(0x1A000000), blurRadius: 12, offset: Offset(0, 4)),
  ];
}
