import 'package:course/Networks/remote/dio.dart';
import 'package:course/layout/newsApp/cubit/cubit.dart';
import 'package:course/layout/newsApp/cubit/satates.dart';
import 'package:course/models/preyer_time.dart';
import 'package:course/shared/bloc/cubit_bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsLayout extends StatelessWidget {
  const NewsLayout({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => NewsCubit()..getData(),
      child: BlocConsumer<NewsCubit, NewsStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = NewsCubit.get(context);
          return Scaffold(
            floatingActionButton:
                FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                // elevation: 20.0,
                currentIndex: cubit.currentIndex,
                onTap: (index) {
                  cubit.chengeBottomNavBar(index);
                },
                items: cubit.bottomItems),
            appBar: AppBar(
              actions: [
                Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.search)),
                    IconButton(
                        onPressed: () {
                          AppCubit.get(context).changeAppMode();
                        },
                        icon: Icon(Icons.brightness_4_outlined)),
                  ],
                )
              ],
              title: Text('News App'),
            ),
            body: cubit.Screens[cubit.currentIndex],
          );
        },
      ),
    );
  }
}
