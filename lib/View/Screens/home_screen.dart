import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:itargs_task/res/media_res.dart';
import 'package:itargs_task/res/styles.dart';

import '../../ViewModel/DashboardController/cubit.dart';
import '../../ViewModel/DashboardController/states.dart';
import '../../generated/l10n.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  @override
  Widget build(BuildContext context) {
    final List<String> sampleTexts = [
      S.of(context).simple_text_1,
      S.of(context).simple_text_2,
      S.of(context).simple_text_3,
    ];

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return BlocBuilder<AppCubit,AppStates>(
        builder: (context, state) {
          AppCubit cubit = AppCubit.get(context);
          return Container(
            width: screenWidth,
            height: screenHeight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20.0,
                      ),
                      Text(
                        S.of(context).top_likes,
                        style:cubit.isDarkMode? Styles.textStyle18Dark:Styles.textStyle18,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 0.5,
                  color: Colors.grey.withOpacity(0.5),
                ),
                ListView.separated(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: sampleTexts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${sampleTexts[index]}',
                              style:cubit.isDarkMode? Styles.textStyle16Dark:Styles.textStyle16,

                            ),
                          ),
                          IconButton(
                            icon: cubit.isFavorited[index] == true
                                ? Image(
                                    image: AssetImage(Media.likeFilledIcon),
                                  )
                                : Image(
                                    image: AssetImage(Media.likeIcon),
                                  ),
                            onPressed: () {
                             cubit.changeFavorite(index);
                            },
                          )
                        ],
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) =>
                      Container(
                    width: screenWidth,
                    height: 0.5,
                    color: Colors.grey.withOpacity(0.5),
                  ),
                ),
                Container(
                  width: screenWidth,
                  height: 0.5,
                  color: Colors.grey.withOpacity(0.5),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30.0,
                      ),
                      Text(
                        S.of(context).top_likes,
                        style:cubit.isDarkMode? Styles.textStyle18Dark:Styles.textStyle18,

                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: screenWidth,
                  height: 0.5,
                  color: Colors.grey.withOpacity(0.5),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {

                          cubit.getAudio();
                        },
                        icon: Image(
                          image: cubit.isPlayed == true
                              ? AssetImage(
                                  Media.pauseIcon,
                                )
                              : AssetImage(
                                  Media.playIcon,
                                ),
                        ),
                      ),
                      Text(
                        S.of(context).play_this,
                        style:cubit.isDarkMode? Styles.textStyle16Dark:Styles.textStyle16,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: screenWidth,
                  height: 0.5,
                  color: Colors.grey.withOpacity(0.5),
                ),
              ],
            ),
          );
        },



    );}




}