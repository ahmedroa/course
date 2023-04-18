import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course/modules/social_App/bloc/bloc_state.dart';
import 'package:course/modules/social_App/chat.dart';
import 'package:course/modules/social_App/feeds.dart';
import 'package:course/modules/social_App/models/classModel.dart';
import 'package:course/modules/social_App/notification.dart';
import 'package:course/modules/social_App/settings.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SocialCubit extends Cubit<SocialCStates> {
  SocialCubit() : super(SocialInitialState());

  static SocialCubit get(context) => BlocProvider.of(context);
  int currentIndex = 0;
  List<Widget> Screens = [
    feeds(),
    ChatScreen(),
    notification(),
    setting(),
  ];
  List<String> titles = [
    'home',
    'chat',
    'users',
    'Settings',
  ];

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

  void chengeBottomNavBar(int index) {
    currentIndex = index;
    emit(SocialBottonNavlState());
  }

  bool isDark = false;
  changeAppMode() {
    isDark = !isDark;
    emit((SocialLCheanModeState()));
  }

  void userLogin({
    required String email,
    required String password,
  }) {
    emit(SocialLodingState());
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) => {
              getUserData(),
              emit(SocialSuccessState()),
              print(value.user!.email),
              print(value.user!.uid),
            })
        .catchError((error) {
      emit(SocialErrorState(error.toString()));
    });
  }

  void userRegister({
    required String email,
    required String name,
    required String phone,
    required String password,
  }) {
    emit(SocialLodingState());
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
          email: email,
          password: password,
        )
        .then((value) => {
              emit(SocialSuccessState()),
              userCreate(
                email: email,
                name: name,
                phone: phone,
                password: password,
                uid: value.user!.uid,
              ),
            })
        .catchError((error) {
      emit(SocialErrorState(error.toString()));
    });
  }

  void userCreate({
    required String email,
    required String name,
    required String phone,
    required String password,
    required String uid,
  }) {
    emit(SocialLodingState());
    SocialUserModel model = SocialUserModel(
      name: name,
      email: email,
      phone: phone,
      uid: uid,
      isEmailVerified: false,
      image: '',
    );
    FirebaseFirestore.instance
        .collection('users')
        .doc(uid)
        .set(model.toMap())
        .then((value) => {emit(SocialSuccessState())})
        .catchError((error) {
      emit(SocialErrorState(error));
    });
  }

  SocialUserModel? socialUserModel;
  var uId;
  void getUserData() {
    uId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .get()
        .then((value) => {
              socialUserModel = SocialUserModel.fromJson(value.data()!),
              emit(SocialSuccessState()),
            })
        .catchError((error) {
      emit(SocialErrorState(error));
    });
  }

  UserModel? userModel;
  List<UserModel> users = [];
  void getUsers() {
    emit(SocialGetAllUseraLodingState());

    // if (users.length == 0)
    FirebaseFirestore.instance
        .collection('users')
        .get()
        .then((value) => {
              value.docs.forEach((element) {
                // if (element.data()['uid'] != socialUserModel!.uid)
                users.add(UserModel.fromJson(element.data()));
              }),
              emit(SocialGetAllUseraSuccessState()),
            })
        .catchError((error) {
      emit(SocialGetAllUsersErrorState(error));
    });
  }

  void sendMessage({
    required String reseiverId,
    required String dateTime,
    required String test,
  }) {
    messageModel model = messageModel(
      senderid: uId,
      receiverID: reseiverId,
      dateTime: dateTime,
      text: test,
    );
    uId = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc(reseiverId)
        .collection('Messages')
        .add(model.toMap())
        .then((value) => {emit(SocialSendMessageSuccessState())})
        .catchError((error) {
      emit(SocialSendMessageErrorState());
    });
    FirebaseFirestore.instance
        .collection('users')
        .doc(reseiverId)
        .collection('chats')
        .doc(uId)
        .collection('Messages')
        .add(model.toMap())
        .then((value) => {emit(SocialSendMessageSuccessState())})
        .catchError((error) {
      emit(SocialSendMessageErrorState());
    });
  }

  List<messageModel> messages = [];
  void getmessags(UserModel userModel) {
   var uIdd = FirebaseAuth.instance.currentUser!.uid;
    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .collection('chats')
        .doc('fwCT3WO2XcT9i0j1AyMEJnFzlah1')
        .collection('Messages')
        // .orderBy('field')
        .snapshots()
        .listen((event) {
      // messages = [];
      print(event.docs);
      event.docs.forEach((element) {
        messages.add(messageModel.fromJson(element.data()));
        print(messages);
        print(element.data());
        print(uId);
        print(userModel.uid);
      });
      emit(SocialGetMessageSuccessState());
    });
  }

  List<MessageDataModel> messagesList = [];
  UserModel? user;
  void getMessages(UserModel userDataModel) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(user!.uid)
        .collection('chats')
        .doc(userDataModel.uid)
        .collection('messages')
        .orderBy(
          'time',
          descending: true,
        )
        .snapshots()
        .listen((value) {
      messagesList = [];

      for (var element in value.docs) {
        messagesList.add(MessageDataModel.fromJson(element.data()));
      }

      debugPrint(messagesList.length.toString());

      emit(SocialGetMessageSuccessState());
    });
  }
}
