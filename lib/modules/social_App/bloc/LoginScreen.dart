import 'package:course/modules/social_App/SocialLayout.dart';
import 'package:course/modules/social_App/bloc/bloc_cubit.dart';
import 'package:course/modules/social_App/bloc/bloc_state.dart';
import 'package:course/modules/social_App/helper/cachHelper.dart';
import 'package:course/modules/social_App/models/cons.dart';
import 'package:course/modules/social_App/ragister.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreenSo extends StatefulWidget {
  const LoginScreenSo({Key? key}) : super(key: key);

  @override
  State<LoginScreenSo> createState() => _LoginScreenSoState();
}

class _LoginScreenSoState extends State<LoginScreenSo> {
  @override
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool isClicked = false;
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => SocialCubit(),
      child: BlocConsumer<SocialCubit, SocialCStates>(
        listener: (context, state) {
          if (state is SocialSuccessState) {
            // CachHelper.saveDate(key: 'uId', value: state.uId).then((value) => {
            Navigator.push(context,
                MaterialPageRoute(builder: ((context) => SocialLayout())));
            // });

            // navigateAnd
            // ScaffoldMessenger.of(context).showSnackBar(
            //   SnackBar(
            //     backgroundColor: Colors.red,
            //     content: const Text('error'),
            //     action: SnackBarAction(
            //       label: 'agin',
            //       onPressed: () {
            //         // Code to execute.
            //       },
            //     ),
            //   ),
            // );
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              // backgroundColor: Colors.blue[900],
              title: Text("welcome"),
              centerTitle: true,
              leading: Icon(Icons.notification_add),
            ),
            body: Form(
              key: formKey,
              child: ListView(children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 90,
                        ),
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 40, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                          controller: email,
                          Label: 'email',
                          inputType: TextInputType.emailAddress,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                            controller: password,
                            Label: 'password',
                            inputType: TextInputType.visiblePassword,
                            isDense: true),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        MaterialButton(
                          color: Colors.blue,
                          height: 42.0,
                          onPressed: () {
                            SocialCubit.get(context).userLogin(
                                email: email.text, password: password.text);
                            CachHelper.saveDate(
                                key: 'uId',
                                value: FirebaseAuth.instance.currentUser!.uid);
                          },
                          child: isClicked
                              ? const CupertinoActivityIndicator(
                                  color: Colors.black)
                              : const Text(
                                  'login',
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                ),
                        ),
                        SizedBox(
                          height: 22,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don\'t have an account? "),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: ((context) => ragister())));
                              },
                              child: Text("Register Now"),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),
          );
        },
      ),
    );
  }
}
