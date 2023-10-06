import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ViewModel/DashboardController/cubit.dart';
import '../../ViewModel/DashboardController/states.dart';
import '../../generated/l10n.dart';
import '../../res/styles.dart';


class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({Key? key, required this.index}) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery
        .of(context)
        .size
        .width;

    List<String> appBarTitles = [
      S
          .of(context)
          .this_is_app,
      S
          .of(context)
          .more,
    ];
    return BlocBuilder<AppCubit, AppStates>(

        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor:cubit.isDarkMode ? Colors.grey.shade900:Colors.white,
              statusBarIconBrightness:cubit.isDarkMode ? Brightness.light:Brightness.dark,
            ),
            backgroundColor: cubit.isDarkMode ? Colors.grey.shade900 : Colors
                .white,
            title: Column(
              children: [
                Text(
                  appBarTitles[index],
                  style: cubit.isDarkMode ? Styles.textStyle22Dark:Styles.textStyle22,
                ),
                SizedBox(
                  height: 20.0,
                ),
                Container(
                  width: screenWidth,
                  height: 0.5,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
            centerTitle: true,

          );
        }

    );

  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize =>  const Size.fromHeight(60);
}


