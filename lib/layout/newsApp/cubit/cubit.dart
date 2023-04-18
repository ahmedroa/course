import 'dart:convert';

import 'package:course/Networks/remote/dio.dart';
import 'package:course/layout/newsApp/cubit/cubit.dart';
import 'package:course/layout/newsApp/cubit/satates.dart';
import 'package:course/models/preyer_time.dart';
import 'package:course/modules/Sports/sports.dart';
import 'package:course/modules/businss/businss.dart';
import 'package:course/modules/sciense/sciense.dart';
import 'package:course/modules/sciense/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsCubit extends Cubit<NewsStates> {
  NewsCubit() : super(NewInitialState());

  static NewsCubit get(context) => BlocProvider.of(context);

  int currentIndex = 0;
  List<BottomNavigationBarItem> bottomItems = [
    BottomNavigationBarItem(
        icon: Icon(
          Icons.business,
        ),
        label: 'busines'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.sports,
        ),
        label: 'sports'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.science,
        ),
        label: 'science'),
    BottomNavigationBarItem(
        icon: Icon(
          Icons.settings,
        ),
        label: 'settings'),
  ];
  List<Widget> Screens = [
    businss(),
    Sports(),
    sciense(),
    settings(),
  ];

  void chengeBottomNavBar(int index) {
    currentIndex = index;
    emit(NewBottonNavlState());
  }

  List<dynamic> business = [];
  PrayerTimes? prayerTimes;

  void getData() {
    emit(GetApiLpLodingsState());
    DioHelper.getData(
      url: 'v1/timingsByCity',
      query: {
        'city': 'SA',
        'country': 'akkah alMuKaramah',
      },
    ).then((value) {
      prayerTimes = PrayerTimes.fromJson(value.data['data']['timings']);
    }).catchError((error) {
      print(error.toString());
    }).then((value) {
      emit(GetApiSuccessState());
    }).catchError((error) {
      emit(GetApiErrorState(error.toString()));
      print(error.toString());
    });
    emit(state);
  }

  CircularProgressr() {
    Center(child: CircularProgressIndicator());
    emit(GetApiLpLodingsState());
  }
}
