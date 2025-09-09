import 'package:flutter/material.dart';

@immutable
class AppGradients extends ThemeExtension<AppGradients> {
  final Gradient videoCard;
  final Gradient progress;
  final Gradient shimmer;

  const AppGradients({
    required this.videoCard,
    required this.progress,
    required this.shimmer,
  });

  @override
  AppGradients copyWith({
    Gradient? videoCard,
    Gradient? progress,
    Gradient? shimmer,
  }) {
    return AppGradients(
      videoCard: videoCard ?? this.videoCard,
      progress: progress ?? this.progress,
      shimmer: shimmer ?? this.shimmer,
    );
  }

  @override
  AppGradients lerp(ThemeExtension<AppGradients>? other, double t) {
    if (other is! AppGradients) return this;
    // Gradients don't lerp well by default; keep the current for simplicity.
    return this;
  }
}

class AppTheme {
  // Brand colors
  static const _deepBlack = Color(0xFF0F0F0F);
  static const _softBlack = Color(0xFF1A1A1A);
  static const _darkGray = Color(0xFF2A2D31);
  static const _mediumGray = Color(0xFF36393F);

  static const _discordBlue = Color(0xFF5865F2);
  static const _successGreen = Color(0xFF57F287);
  static const _tertiaryBlue = Color(0xFF7289DA);

  static const _white = Color(0xFFFFFFFF);
  static const _lightGray = Color(0xFFB9BBBE);
  static const _mutedGray = Color(0xFF72767D);

  static const _errorRed = Color(0xFFED4245);
  static const _warningYellow = Color(
    0xFFFEE75C,
  ); // via extension or custom usage

  static ColorScheme _darkColorScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: _discordBlue,
      onPrimary: _white,
      secondary: _successGreen,
      onSecondary: _deepBlack,
      tertiary: _tertiaryBlue,
      onTertiary: _white,

      background: _deepBlack,
      onBackground: _white,
      surface: _darkGray,
      onSurface: _white,

      surfaceVariant: _mediumGray,
      onSurfaceVariant: _lightGray,

      error: _errorRed,
      onError: _white,

      outline: _mutedGray,
      outlineVariant: _mutedGray,

      shadow: Colors.black,
      scrim: Colors.black,

      inverseSurface: _softBlack,
      onInverseSurface: _white,
      inversePrimary: _tertiaryBlue,
    );
  }

  static final dark = ThemeData(
    useMaterial3: true,
    colorScheme: _darkColorScheme(),
    scaffoldBackgroundColor: _deepBlack, // ensures Scaffold uses your canvas
    appBarTheme: const AppBarTheme(
      backgroundColor: _deepBlack,
      foregroundColor: _white,
      elevation: 0,
      centerTitle: false,
    ),
    cardColor: _darkGray,
    dividerColor: _mutedGray,
    textTheme: Typography.whiteMountainView.apply(
      bodyColor: _white,
      displayColor: _white,
    ),
    extensions: [
      AppGradients(
        videoCard: const LinearGradient(
          colors: [_discordBlue, _tertiaryBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        progress: const LinearGradient(
          colors: [_successGreen, Color(0xFF43B581)],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        shimmer: const LinearGradient(
          colors: [_darkGray, _mediumGray],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
      ),
    ],
  );

  // static final light = ThemeData(
  //   useMaterial3: true,
  //   colorScheme: _darkColorScheme().copyWith(
  //     brightness: Brightness.light,
  //     background: const Color(0xFFF7F7F8),
  //     onBackground: const Color(0xFF111111),
  //     surface: const Color(0xFFFFFFFF),
  //     onSurface: const Color(0xFF111111),
  //     surfaceVariant: const Color(0xFFF0F2F5),
  //     onSurfaceVariant: const Color(0xFF585D66),
  //     outline: const Color(0xFFB9BBBE),
  //     outlineVariant: const Color(0xFFD5D7DB),
  //   ),
  //   scaffoldBackgroundColor: const Color(0xFFF7F7F8),
  //   textTheme: Typography.blackMountainView,
  // );
}
