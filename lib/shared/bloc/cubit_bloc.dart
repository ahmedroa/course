import 'package:course/Networks/remote/dio.dart';
import 'package:course/layout/Done_tasks_Screen.dart';
import 'package:course/layout/New_Task.dart';
import 'package:course/layout/newsApp/cubit/cubit.dart';
import 'package:course/modules/social_App/helper/cachHelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:course/models/login/counter/cubit/state.dart';
import 'package:course/shared/bloc/cubit_state.dart';

import '../../models/login/archive/archive_tasts.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;

  List<Widget> screens = [
    newTasksScreen(),
    archiveTasksScreen(),
    DoneTaskScreen(),
  ];

  List<String> titles = [
    "New Tasks",
    "Done Tasks",
    "Archived Tasks",
  ];

  void ChengeIndex(int index) {
    currentIndex = index;
    emit(AppCheangeBottomNavigationBar());
  }

  var uId = CachHelper.getDate(key: 'uId');
  bool isDark = false;
  changeAppMode() {
    isDark = !isDark;
    emit(AppCheanModeState());
  }
}
