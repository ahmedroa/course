import 'package:course/modules/social_App/SocialLayout.dart';
import 'package:course/modules/social_App/bloc/LoginScreen.dart';
import 'package:course/modules/social_App/bloc/bloc_cubit.dart';
import 'package:course/modules/social_App/bloc/bloc_state.dart';
import 'package:course/modules/social_App/helper/cachHelper.dart';
import 'package:course/modules/social_App/models/cons.dart';
import 'package:course/shared/components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ragister extends StatefulWidget {
  const ragister({Key? key}) : super(key: key);

  @override
  State<ragister> createState() => _ragisterState();
}

class _ragisterState extends State<ragister> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool isVisible = true;
  bool isClicked = false;
  @override
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
                          "ragister",
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
                          controller: name,
                          Label: 'name',
                          inputType: TextInputType.name,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        defaultTextField(
                          controller: phone,
                          Label: 'phone',
                          inputType: TextInputType.phone,
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
                            SocialCubit.get(context).userRegister(
                              email: email.text,
                              password: password.text,
                              name: name.text,
                              phone: phone.text,
                            );
                          },
                          child: isClicked
                              ? const CupertinoActivityIndicator(
                                  color: Colors.white)
                              : const Text(
                                  'ragister',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20),
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
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            const LoginScreenSo()),
                                    (route) => false);
                              },
                              child: Text(" Login"),
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
