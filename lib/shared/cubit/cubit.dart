import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/shared/cubit/states.dart';
import 'package:news_app/shared/network/local/cache_helper.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  //create obj from cubit access from cubit
  static AppCubit get(context) => BlocProvider.of(context);
  //
  // // bottom nav bar
  // int currentIndex = 0;
  // List<Widget> screens = const [
  //   NewTasksScreen(),
  //   DoneTasksScreen(),
  //   ArchivedTasksScreen(),
  // ];
  //
  // List<String> screensTitle = const [
  //   'New Tasks',
  //   'Done Tasks',
  //   'Archived Tasks',
  // ];
  //
  // void changeIndex(int index) {
  //   currentIndex = index;
  //   emit(AppChangeBottomNavBatState());
  // }
  //
  // //database create , insert and get
  // Database? database;
  // List<Map> newTasks = [];
  // List<Map> doneTasks = [];
  // List<Map> archivedTasks = [];
  //
  // //create database
  // void createDatabase() {
  //   // database = await openDatabase(
  //   openDatabase(
  //     'todo.db',
  //     version: 1,
  //     onCreate: (database, version) {
  //       // ID INTEGER
  //       // title string
  //       // time string
  //       // date string
  //       // status string
  //       print('database created');
  //       database
  //           .execute(
  //         'CREATE TABLE tasks (id INTEGER PRIMARY KEY , title TEXT,date TEXT,time TEXT, status TEXT)',
  //       )
  //           .then((value) {
  //         print('table created');
  //       }).catchError((error) {
  //         print('error when table created ${error.toString()}');
  //       });
  //     },
  //     onOpen: (database) {
  //       // getDataFromDatabase(database).then((value) {
  //       //   tasks = value;
  //       //   print(tasks);
  //       //   emit(AppGetDatabaseState());
  //       // });
  //       getDataFromDatabase(database);
  //       print('database opened');
  //
  //       //{id: 1, title: first task, date: 02222, time: 891, status: new}
  //     },
  //   ).then((value) {
  //     database = value;
  //     emit(AppCreateDatabaseState());
  //   });
  // }
  //
  // //insert to database
  // void insertToDatabase({
  //   required String title,
  //   required String time,
  //   required String date,
  // }) async {
  //   await database?.transaction((txn) {
  //     return txn
  //         .rawInsert(
  //       'INSERT INTO tasks(title,date,time,status) VALUES ("$title", "$date","$time","new")',
  //     )
  //         .then((value) {
  //       print('$value inserted Successfully');
  //       emit(AppInsertDatabaseState());
  //       // getDataFromDatabase(database).then((value) {
  //       //   tasks = value;
  //       //   print(tasks);
  //       //   emit(AppGetDatabaseState());
  //       // });
  //       getDataFromDatabase(database);
  //     }).catchError((error) {
  //       print('Error when inserting new record $error');
  //     });
  //   });
  // }
  //
  // //get from database
  // void getDataFromDatabase(database) {
  //   newTasks= [];
  //   doneTasks=[];
  //   archivedTasks=[];
  //   emit(AppGetDatabaseLoadingState());
  //   database.rawQuery('SELECT * FROM tasks').then((value) {
  //     // tasks = value;
  //     // print(tasks);
  //
  //
  //     value.forEach((element) {
  //       // print(element['status']);
  //       if (element['status'] == 'new') {
  //         newTasks.add(element);
  //       } else if (element['status'] == 'done') {
  //         doneTasks.add(element);
  //       } else {
  //         archivedTasks.add(element);
  //       }
  //     });
  //     emit(AppGetDatabaseState());
  //   });
  // }
  //
  // // update to database
  // void updateData({
  //   required String status,
  //   required int id,
  // }) {
  //   database!.rawUpdate(
  //     'UPDATE tasks SET status = ? WHERE id = ?',
  //     ['$status', id],
  //   ).then((value) {
  //     print('Updated Succefully');
  //
  //     emit(AppUpdateDatabaseState());
  //     getDataFromDatabase(database);
  //   });
  // }
  //
  // // delete to database
  // void deleteData({
  //   required int id,
  // }) {
  //   database!.rawUpdate(
  //       'DELETE FROM tasks WHERE id = ?', [id]
  //   ).then((value) {
  //     print('Deleted Succefully');
  //
  //     emit(AppDeleteDatabaseState());
  //     getDataFromDatabase(database);
  //   });
  // }
  //
  // // bottom sheet
  // bool isBottomSheetShown = false;
  // IconData fabIcon = Icons.edit;
  //
  // void changeBottomSheetState({
  //   required bool isShow,
  //   required IconData icon,
  // }) {
  //   isBottomSheetShown = isShow;
  //   fabIcon = icon;
  //   emit(AppChangeBottomSheetState());
  // }

  // change app theme
  bool isDark = false;
  void changeAppMode({bool? fromShared}) {
    if (fromShared != null) {
      isDark = fromShared;
      emit(NewsChangeAppModeState());
    } else {
      isDark = !isDark;
      CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
        emit(NewsChangeAppModeState());
      });
    }
  }
}
