import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/layout/news_app/cubit/cubit.dart';
import 'package:news_app/layout/news_app/cubit/states.dart';
import 'package:news_app/layout/news_app/news_layout.dart';
import 'package:news_app/shared/bloc_observer.dart';
import 'package:news_app/shared/cubit/cubit.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';
import 'package:news_app/shared/network/remote/dio_helper.dart';

void main() async {
  // بيتأكد كل حاجة هنا في الميتود خلصت وبعدين يفتح الابلكيشن
  WidgetsFlutterBinding
      .ensureInitialized(); //عشان ينفذ الحاجات الي عليها اويت وبعدين ينفد runapp

  Bloc.observer = MyBlocObserver();
  DioHelper.init();
  await CacheHelper.init();

  bool isDark = CacheHelper.getBoolean(key: 'isDark') ?? false;
  runApp(MyApp(
    isDark: isDark,
  ));
}

// Stateless
// Stateful

// class MyApp
class MyApp extends StatelessWidget {
  // constractor
  // build
  final bool isDark;

  const MyApp({super.key, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          AppCubit()
            ..changeAppMode(
              fromShared: isDark,
            ),
        ),
        BlocProvider(create: (context) =>  NewsCubit()..getBusiness()),

      ],
      child: BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              // primarySwatch: Colors.deepOrange,
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepOrange,
                brightness: Brightness.dark,
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                systemOverlayStyle: SystemUiOverlayStyle(
                  // statusBarColor: Colors.black, // change status bat style
                  statusBarBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: Colors.white,
              ),
              textTheme: TextTheme(
                displayMedium: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),

              ),
            ),
            darkTheme: ThemeData(
              useMaterial3: true,
              scaffoldBackgroundColor: Color(0xff333739),
              colorScheme: ColorScheme.fromSwatch(
                primarySwatch: Colors.deepOrange,
              ),
              floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
              ),
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Color(0xff333739), // change status bat style
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor: Color(0xff333739),
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                unselectedItemColor: Colors.grey,
                elevation: 20,
                backgroundColor: Color(0xff333739),
              ),
              textTheme: TextTheme(
                displayMedium: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            themeMode:
            AppCubit
                .get(context)
                .isDark ? ThemeMode.dark : ThemeMode.light,
            home: Directionality(
                textDirection: TextDirection.ltr, child: NewsLayout()),
          );
        },
      ),
    );
  }
}
