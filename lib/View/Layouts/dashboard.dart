import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itargs_task/View/Screens/home_screen.dart';
import 'package:itargs_task/View/Widgets/app_bar.dart';

import '../../ViewModel/DashboardController/cubit.dart';
import '../../ViewModel/DashboardController/states.dart';
import '../../generated/l10n.dart';
import '../../res/styles.dart';
import '../Screens/more_screen.dart';

class DashboardLayout extends StatelessWidget {
  const DashboardLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocBuilder<AppCubit,AppStates>(

        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            backgroundColor: cubit.isDarkMode ? Colors.grey.shade900 : Colors.white,
            appBar:AppBarWidget(index: cubit.currentIndex),

            body:cubit.screens[cubit.currentIndex],

            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex ,
              type: BottomNavigationBarType.fixed,
              selectedItemColor: Colors.deepPurple,
              unselectedItemColor: Colors.grey,
              elevation: 20.0,
              backgroundColor: cubit.isDarkMode?  Colors.grey.shade900:Colors.white ,
              onTap: (index){
                cubit.changeIndex(index);
              },
              items: [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: S.of(context).home,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.more_outlined),
                  label:S.of(context).more,
                ),
              ],

            ),
          );
        },



    );}




}


