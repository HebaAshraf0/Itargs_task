import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ViewModel/DashboardController/cubit.dart';
import '../../ViewModel/DashboardController/states.dart';
import '../../generated/l10n.dart';
import '../../res/media_res.dart';
import '../../res/styles.dart';

class MoreScreen extends StatelessWidget {
  const MoreScreen({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    double screenWidth= MediaQuery.of(context).size.width;
    double screenHeight= MediaQuery.of(context).size.height;



    return  BlocBuilder<AppCubit,AppStates>(
        builder: (BuildContext context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);


              return Container(
                width: screenWidth,
                height: screenHeight,
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start ,

                  children: [

                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20.0,
                          ),
                          Text(
                            S.of(context).settings,
                            style:cubit.isDarkMode? Styles.textStyle18Dark:Styles.textStyle18,                      ),

                        ],
                      ),
                    ),
                    Container(
                      width:screenWidth,
                      height: 0.5,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
//mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).dark_mode,
                              style:cubit.isDarkMode? Styles.textStyle16Dark:Styles.textStyle16,                        ),
                          ),
                          IconButton(

                            icon:cubit.isDarkMode==true? Image(
                              image: AssetImage(Media.onIcon),
                              width: 40,
                              height: 40,
                            ):Image(
                              image: AssetImage(Media.offIcon),
                              width: 40,
                              height: 40,
                            ),

                            onPressed: (){
                              cubit.changeTheme();
                            },

                          )
                        ],
                      ),
                    ),
                    Container(
                      width:screenWidth,
                      height: 0.5,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Row(
//mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              S.of(context).Arabic_language,
                              style:cubit.isDarkMode? Styles.textStyle16Dark:Styles.textStyle16,                        ),
                          ),
                          IconButton(


                            icon:cubit.isPressed==true? Image(
                              image: AssetImage(Media.onIcon),
                              width: 40,
                              height: 40,
                            ):Image(
                              image: AssetImage(Media.offIcon),
                              width: 40,
                              height: 40,
                            ),



                            onPressed: (){
                              String locale;
                              if(cubit.isPressed){
                                locale='ar';
                              }else{locale='en';}
                              cubit.changeLanguage(locale);

                            },

                          ),




                        ],
                      ),
                    ),
                  ],
                ),

              );


        },



    );}




}
