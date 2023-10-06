import 'dart:ui';

abstract class AppStates {

}
class AppInitialState extends AppStates{}

class AppChangeBottomNavBarState extends AppStates{}

class AppChangeFavoriteBarState extends AppStates{}

class AppChangeThemeState extends AppStates{}

class AppChangeLanguageState extends AppStates{
  final Locale locale;

  AppChangeLanguageState({required this.locale});
}

class AppPauseAudioState extends AppStates{}
class AppPlayAudioState extends AppStates{}