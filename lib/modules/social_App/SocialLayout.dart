import 'package:course/modules/social_App/bloc/bloc_cubit.dart';
import 'package:course/modules/social_App/bloc/bloc_state.dart';
import 'package:course/modules/social_App/helper/cachHelper.dart';
import 'package:course/modules/social_App/models/classModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialLayout extends StatelessWidget {
  const SocialLayout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SocialUserModel model;
    return BlocProvider(
      create: (BuildContext context) => SocialCubit()
        ..getUserData()
        ..getUsers(),
      child: BlocConsumer<SocialCubit, SocialCStates>(
        listener: (context, state) {
          if (state is SocialSuccessState) {
            var userModel = SocialCubit.get(context).socialUserModel;
            print(userModel);
            print('=====================');
            print(userModel);
          }
        },
        builder: (context, state) {
          var cubit = SocialCubit.get(context);

          var userModel = SocialCubit.get(context).socialUserModel;
          return Scaffold(
            appBar: AppBar(
              title: Text(cubit.titles[cubit.currentIndex]),
              // centerTitle: true,
              actions: [
                IconButton(
                  icon: Icon(Icons.notification_add),
                  onPressed: () {},
                ),
                IconButton(
                  icon: Icon(Icons.search),
                  onPressed: () {},
                ),
                IconButton(
                    onPressed: () {
                      cubit.changeAppMode();
                    },
                    icon: Icon(Icons.brightness_4_outlined)),
              ],
            ),
            body: cubit.Screens[cubit.currentIndex],
            bottomNavigationBar: BottomNavigationBar(
              onTap: (index) {
                cubit.chengeBottomNavBar(index);
              },
              currentIndex: cubit.currentIndex,
              items: [
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'home'),
                BottomNavigationBarItem(
                  icon: Icon(Icons.chat),
                  label: 'chat',
                ),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.person,
                    ),
                    label: 'person'),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.settings,
                    ),
                    label: 'settings'),
              ],
            ),
          );
        },
      ),
    );
  }
}
