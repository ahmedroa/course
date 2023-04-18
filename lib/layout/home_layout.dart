import 'package:course/layout/Done_tasks_Screen.dart';
import 'package:course/layout/New_Task.dart';
import 'package:course/shared/bloc/cubit_bloc.dart';
import 'package:course/shared/bloc/cubit_state.dart';
import 'package:course/widgets/add_task.Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../models/login/archive/archive_tasts.dart';
import 'package:sqflite/sqflite.dart';

class HomeLayout extends StatelessWidget {
  var titleController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();
  var Scaffoldkey = GlobalKey<ScaffoldState>();
  var formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppStates>(
          listener: (context, state) {},
          builder: (context, state) {
            AppCubit cubit = AppCubit.get(context);
            return Scaffold(
              appBar: AppBar(
                title: Text(cubit.titles[cubit.currentIndex]),
              ),
              body: cubit.screens[cubit.currentIndex],
              // body: screens[currentIndex],
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: ((context) => AddTaskScreen()));
                },
                child: Icon(Icons.add),
              ),
              bottomNavigationBar: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  // elevation: 20.0,
                  currentIndex:
                      AppCubit.get(context).currentIndex, // يحدد الصفحة
                  onTap: (index) {
                    cubit.ChengeIndex(index);
                    // setState(() {
                    //   currentIndex = index;
                    // });
                    print(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.menu), label: 'tasks'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.archive_outlined), label: 'Done'),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.archive), label: 'archive')
                  ]),
            );
          }),
    );
  }
}
