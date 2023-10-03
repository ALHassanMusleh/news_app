import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/modules/business_news/business_screen.dart';
import 'package:news_app/modules/science_news/science_screen.dart';
import 'package:news_app/modules/settings_news/settings_screen.dart';
import 'package:news_app/modules/sports_news/sports_screen.dart';
import 'package:news_app/shared/component/constants.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewsInitialState());

  static NewsCubit get(context) => BlocProvider.of<NewsCubit>(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItem = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.sports,
      ),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.science,
      ),
      label: 'Science',
    ),
    // BottomNavigationBarItem(
    //   icon: Icon(
    //     Icons.settings,
    //   ),
    //   label: 'Settings',
    // ),
  ];

  List<Widget> screens =  [
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    // SettingsScreen(),
  ];
  //change bottom bar item
  void changeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewsBottomNavState());
    if (index == 0) getBusiness();
    if (index == 1) getSports();
    if (index == 2) getScience();
    // emit(NewsBottomNavState()) ;
  }

  // get business news
  List<dynamic> business = [];
  void getBusiness() {
    emit(NewsGetBusinessLoadingState());
    if(business.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'business',
          // 'apiKey': '11a12dc9defa43c385fba00c931cc503',
          'apiKey': '$API_KEY',
        },
      ).then((value) {
        print(value.data.toString());
        // print('total result is :  ${value.data['totalResults']}');
        // print(value.data['articles'][0]['author']);
        business = value.data['articles'];

        print(business[1]['title']);
        emit(NewsGetBusinessSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetBusinessFailureState(error: error.toString()));
      });
    }else {
      emit(NewsGetBusinessSuccessState());

    }
  }

  // get sports news
  List<dynamic> sports = [];
  void getSports() {
    emit(NewsGetSportsLoadingState());
    if (sports.length == 0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'us',
          'category': 'Sports',
          // 'apiKey': '11a12dc9defa43c385fba00c931cc503',
          'apiKey': '$API_KEY',
        },
      ).then((value) {
        print(value.data.toString());
        // print('total result is :  ${value.data['totalResults']}');
        // print(value.data['articles'][0]['author']);
        sports = value.data['articles'];

        print(sports[1]['title']);
        // emit(NewsGetSportsSuccessState(sports: sports));
        emit(NewsGetSportsSuccessState());
      }).catchError((error) {
        print(error.toString());
        emit(NewsGetSportsFailureState(error: error.toString()));
      });
    } else {
      // emit(NewsGetSportsSuccessState(sports: sports));
      emit(NewsGetSportsSuccessState());
    }
  }

  // get science news
  List<dynamic> science = [];
  void getScience() {
    emit(NewsGetScienceLoadingState());
    if (science.length == 0) {
    DioHelper.getData(
      url: 'v2/top-headlines',
      query: {
        'country': 'us',
        'category': 'Science',
        // 'apiKey': '11a12dc9defa43c385fba00c931cc503',
        'apiKey': '$API_KEY',
      },
    ).then((value) {
      print(value.data.toString());
      // print('total result is :  ${value.data['totalResults']}');
      // print(value.data['articles'][0]['author']);
      science = value.data['articles'];

      print(science[1]['title']);
      emit(NewsGetScienceSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsGetScienceFailureState(error: error.toString()));
    });
    } else {
      emit(NewsGetScienceSuccessState());
    }
  }

  // search news
  List<dynamic> search = [];
  void searchNews({
    required String value,
  }) {
    emit(NewsSearchLoadingState());
    DioHelper.getData(
      url: 'v2/everything',
      query: {
        'q': '$value',
        // 'apiKey': '11a12dc9defa43c385fba00c931cc503',
        'apiKey': '$API_KEY',
      },
    ).then((value) {
      print(value.data.toString());
      // print('total result is :  ${value.data['totalResults']}');
      // print(value.data['articles'][0]['author']);
      search = value.data['articles'];
      emit(NewsSearchSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(NewsSearchFailureState(error: error.toString()));
    });
  }
//
//   // change app theme
// bool isDark = false;
//   void changeAppMode(){
//     isDark = !isDark;
//     emit(NewsChangeAppModeState());
//   }
}
