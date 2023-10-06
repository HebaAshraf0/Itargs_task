import 'package:audioplayers/audioplayers.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itargs_task/ViewModel/DashboardController/states.dart';


import '../../View/Screens/home_screen.dart';
import '../../View/Screens/more_screen.dart';
import '../../generated/l10n.dart';
import '../language_cache_helper.dart';

class AppCubit extends Cubit<AppStates> {

  AppCubit() : super (AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);


  List<Widget> screens = [
    HomeScreen(),
    MoreScreen(),
  ];

  final List<bool> isFavorited = [
    false,
    false,
    false
  ];


  int currentIndex =0;

  bool isPressed=false;

  bool isDarkMode = false;

  bool isPlayed = false;

  AudioPlayer audioPlayer = AudioPlayer();

  Locale ar = Locale('en');



  void changeIndex (int index ){
    currentIndex=index;
    emit(AppChangeBottomNavBarState());
  }

  void changeFavorite (int index ){
    isFavorited[index] = !isFavorited[index];
    emit(AppChangeFavoriteBarState());
  }


  void changeTheme(){
    isDarkMode=!isDarkMode;
    emit(AppChangeThemeState());
  }




  Future<void> getSavedLanguage() async {
    final String cachedLanguageCode =
    await LanguageCacheHelper().getCachedLanguageCode();

    emit(AppChangeLanguageState(locale: Locale(cachedLanguageCode)));
  }

  Future<void> changeLanguage(String languageCode) async {
    await LanguageCacheHelper().cacheLanguageCode(languageCode);
    emit(AppChangeLanguageState(locale: Locale(languageCode)));
  }



  void getAudio() async{
    var url = "https://download.quranicaudio.com/qdc/abdul_baset/mujawwad/1.mp3";
    Source source = UrlSource(url);
    if(isPlayed){
      //pause
      await audioPlayer.pause();
      isPlayed = false;
      emit(AppPauseAudioState());

    }
    else {
      //play
      await audioPlayer.play(source);
      isPlayed = true;
      emit(AppPlayAudioState());

    }
  }
}
