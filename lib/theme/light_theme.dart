part of 'theme.dart';

ThemeData theme() {
  return ThemeData(
    primaryColor: kPrimaryColor,
    scaffoldBackgroundColor: kBackgroundColor1,
    appBarTheme: AppBarTheme(
      iconTheme: iconThemeData(),
      backgroundColor: kBackgroundColor1,
      titleTextStyle: primaryTextStyle.copyWith(
        fontSize: 18,
      ),
      elevation: 1,
      centerTitle: true,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: kPrimaryColor,
      foregroundColor: kBackgroundColor2,
    ),
    inputDecorationTheme: inputDecorationTheme(),
  );
}

InputDecorationTheme inputDecorationTheme() {
  return InputDecorationTheme(
    hintStyle: subtitleTextStyle.copyWith(
      fontSize: 14,
    ),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: kSecondaryColor,
      ),
    ),
    contentPadding: const EdgeInsets.symmetric(
      vertical: 10.0,
      horizontal: 10.0,
    ),
  );
}

IconThemeData iconThemeData() {
  return const IconThemeData(
    color: kPrimaryColor,
  );
}
