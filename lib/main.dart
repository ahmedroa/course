import 'package:course/Networks/remote/dio.dart';
import 'package:course/modules/social_App/SocialLayout.dart';
import 'package:course/modules/social_App/bloc/LoginScreen.dart';
import 'package:course/modules/social_App/bloc/bloc_cubit.dart';
import 'package:course/modules/social_App/bloc/bloc_state.dart';
import 'package:course/modules/social_App/chat.dart';
import 'package:course/modules/social_App/helper/cachHelper.dart';
import 'package:course/modules/social_App/ragister.dart';
import 'package:course/shared/BlocObserver.dart';
import 'package:course/shared/bloc/cubit_bloc.dart';
import 'package:course/shared/bloc/cubit_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/newsApp/NewsLayout.dart';

void main() async {
  Bloc.observer = MyBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await CachHelper.init();
  DioHelper.inIt();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    late bool islogin;
    var user = FirebaseAuth.instance.currentUser;
    if (user == null) {
      islogin = false;
    } else {
      islogin = true;
    }
    return BlocProvider(
      create: (BuildContext context) => SocialCubit()
        ..getUserData()
        ..getUsers()
        // ..getmessags(reseiverId: 'reseiverId')
        ..changeAppMode(),
      child: BlocConsumer<SocialCubit, SocialCStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              darkTheme: ThemeData(
                  scaffoldBackgroundColor: Color(0xff6a737b),
                  appBarTheme: AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.white),
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Color(0xff6a737b),
                        statusBarIconBrightness: Brightness.light,
                      ),
                      backgroundColor: Color(0xff6a737b),
                      elevation: 0.0,
                      titleTextStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.deepOrange),
                  // pr: Colors.deepOrange,

                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange,
                      elevation: 20.0)),
              theme: ThemeData(
                  primaryColor: Colors.deepOrange,
                  scaffoldBackgroundColor: Colors.white,
                  appBarTheme: AppBarTheme(
                      iconTheme: IconThemeData(color: Colors.black),
                      backwardsCompatibility: false,
                      systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: Colors.white,
                        statusBarIconBrightness: Brightness.dark,
                      ),
                      backgroundColor: Colors.white,
                      elevation: 0.0,
                      titleTextStyle: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  floatingActionButtonTheme: FloatingActionButtonThemeData(
                      backgroundColor: Colors.deepOrange),
                  // pr: Colors.deepOrange,

                  bottomNavigationBarTheme: BottomNavigationBarThemeData(
                      type: BottomNavigationBarType.fixed,
                      selectedItemColor: Colors.deepOrange,
                      elevation: 20.0)),
              themeMode: SocialCubit.get(context).isDark
                  ? ThemeMode.light
                  : ThemeMode.dark,
              // home: islogin == false ? LoginScreenSo() : ChatScreen()
              home: islogin == false ? ChatScreen() : LoginScreenSo()
              // home: SocialCubit.get(context).uId != null
              // ? const LoginScreenSo()
              // : const ChatScreen(),
              // home: NewsLayout(),
              );
        },
      ),
    );
  }
}
