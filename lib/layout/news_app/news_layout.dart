import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/search/search_screen.dart';
import 'package:news_app/shared/component/components.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = NewsCubit.get(context);

        return Scaffold(
          appBar: AppBar(
            title: Text(
              'News App',
            ),
            actions: [
              IconButton(
                onPressed: () {
                  naviagateTo(context, SearchScreen());
                },
                icon: Icon(
                  Icons.search,
                ),
              ),
              IconButton(
                onPressed: () {
                  AppCubit.get(context).changeAppMode();
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                ),
              ),
            ],
          ),
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     DioHelper.getData(
          //       url: 'v2/top-headlines',
          //       query: {
          //         'country': 'us',
          //         'category': 'business',
          //         'apiKey': '11a12dc9defa43c385fba00c931cc503',
          //       },
          //     ).then((value) {
          //       print(value.data.toString());
          //       print('total result is :  ${value.data['totalResults']}');
          //       print(value.data['articles'][0]['author']);
          //     }).catchError((error){
          //       print(error.toString());
          //     });
          //   },
          //   child: Icon(
          //     Icons.add,
          //   ),
          // ),
          body: cubit.screens[cubit.currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.currentIndex,
            onTap: (index) {
              cubit.changeBottomNavBar(index);
            },
            items: cubit.bottomItem,
          ),
        );
      },
    );
  }
}
