import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:itargs_task/View/Screens/home_screen.dart';
import 'package:itargs_task/View/Screens/more_screen.dart';
import 'package:itargs_task/res/fonts.dart';
import 'package:itargs_task/res/styles.dart';

import 'View/Layouts/dashboard.dart';
import 'ViewModel/DashboardController/cubit.dart';
import 'ViewModel/DashboardController/states.dart';
import 'generated/l10n.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});


  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<AppCubit>(
              create: (context) => AppCubit()..getSavedLanguage()),
        ],
        child:
          BlocBuilder<AppCubit,AppStates>(
              builder: (context,AppStates state){
                if (state is AppChangeLanguageState)
                {
                return  MaterialApp(

                  localizationsDelegates: [
                    S.delegate,
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  supportedLocales: S.delegate.supportedLocales,
                  locale: state.locale,
                  home: DashboardLayout(),
                  debugShowCheckedModeBanner: false,
                );
                }
                else {
                  return MaterialApp(

                    localizationsDelegates: [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales: S.delegate.supportedLocales,
                    locale: Locale('ar'),
                    home: DashboardLayout(),
                    debugShowCheckedModeBanner: false,
                  );
                }

              },
          ),
        );
  }
}






