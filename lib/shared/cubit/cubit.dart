// import 'package:app/shared/cubit/states.dart';
// import 'package:app/shared/network/local/cache_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:sqflite/sqflite.dart';
// import '../../modules/todo_app/archived_task/archived_task_screen.dart';
// import '../../modules/todo_app/done_task/done_task_screen.dart';
// import '../../modules/todo_app/new_task/new_task_screen.dart';
//
// class AppCubit extends Cubit<AppStates> {
//
//   AppCubit() :  super(AppInitialState());
//   static AppCubit get(context) => BlocProvider.of<AppCubit>(context);
//   int currentIndex = 0;
//   List<Widget> screens = [
//     NewTaskScreen(),
//     DoneTaskScreen(),
//     ArchivedTaskScreen(),
//   ];
//   List<String> titles = ['New Tasks', 'Done Tasks', 'Archived Tasks'];
//
// void changeState (int index){
//   currentIndex = index;
//   emit(AppChangeBottomNavBarState());
// }
//
// late Database database;
// List<Map> newtasks = [];
// List<Map> donetasks = [];
// List<Map> archivetasks = [];
//
//   Future createDatabase() async {
//      await openDatabase(
//       'todo.db',
//       version: 1,
//       onCreate: ( database, version) {
//         print('database created');
//         database.execute(
//             ' CREATE TABLE tasks (id INTEGER PRIMARY KEY, title TEXT, date TEXT, time TEXT, status TEXT) ')
//             .then(
//               (value) {
//             try {
//               print('table created');
//             } catch (error) {
//               print('error${error.toString()}');
//             }
//           },
//         );
//       },
//       onOpen: (database) {
//         getDataFromDatabase( database );
//         print('database opened');
//       },
//     ).then((value){
//       database =  value;
//       emit(AppCreateDatabaseState());
//     }) ;
//   }
//
//    insertToDatabase({
//     required String title,
//     required String date,
//     required String time,
//   })
//    async {
//      await database.transaction((txn) async {
//          await txn.rawInsert(
//             'INSERT INTO tasks(title, date, time, status) VALUES("$title","$date","$time","new")'
//         ).then( (value) {
//             print('$value inserted successfully');
//             emit(AppInsertDatabaseState());
//
//             getDataFromDatabase( database );
//               },
//         ).catchError((error) {
//           print('error when inserting ${error.toString()}');
//         });
//       });
//   }
//   void getDataFromDatabase (database)
//   {
//     newtasks = [];
//     donetasks = [];
//     archivetasks = [];
//
//     emit(AppGetDatabaseLoadingState());
//      database.rawQuery('SELECT * FROM tasks').then((value){
//       value.forEach((element){
//         if(element['status']== 'new')
//           newtasks.add(element);
//         else if(element['status']== 'done')
//           donetasks.add(element);
//         else archivetasks.add(element);
//       });
//       emit(AppGetDatabaseState());
//      });
//   }
//
//   bool isBottomSheetShow = false;
//   IconData fabIcon = Icons.edit;
//   void changeBottomSheetState ({
//     required bool isShow,
//     required IconData icon,
// }){
//     isBottomSheetShow = isShow;
//     fabIcon = icon;
//     emit(AppChangeBottomSheetState());
//   }
//   void updateDatabase({
//     required String status,
//     required int id,
//   }) async
//   {
//     database.rawUpdate(
//       'UPDATE tasks SET status = ? WHERE id = ?',
//       ['$status', id],
//     ).then((value)
//     {
//       getDataFromDatabase(database);
//       emit(AppUpdateDatabaseState());
//     });
//
// }
//   void deleteDatabase({
//     required int id,
//   }) async
//   {
//     database.rawDelete(
//         'DELETE FROM tasks WHERE id = ?', [id]
//     ).then((value)
//     {
//       getDataFromDatabase(database);
//       emit(AppDeleteDatabaseState());
//     });
//   }
//
//   bool isDark = false;
//
//   void changeThemeMode ({ bool? fromShared}){
//     if(fromShared != null)
//     {
//       isDark = fromShared;
//       emit(AppChangeThemeModeState());
//
//     } else {
//       isDark = !isDark;
//       CacheHelper.putBoolean(key: 'isDark', value: isDark).then((value) {
//         emit(AppChangeThemeModeState());
//       });
//     }
//   }
//
// }