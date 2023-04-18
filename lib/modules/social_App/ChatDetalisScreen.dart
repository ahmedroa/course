import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:course/modules/social_App/bloc/bloc_cubit.dart';
import 'package:course/modules/social_App/bloc/bloc_state.dart';
import 'package:course/modules/social_App/models/classModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChatDetalisScreen extends StatelessWidget {
  UserModel userModel;
  ChatDetalisScreen({Key? key, required this.userModel}) : super(key: key);

  var messageController = TextEditingController();
  GlobalKey<FormState> formState = new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (BuildContext context) {
        // SocialCubit.get(context).getmessags(reseiverId: widget.userModel.uid);
        var cubit = SocialCubit.get(context);
        return BlocProvider(
          create: (BuildContext context) =>
              SocialCubit()..getmessags(userModel),
          child: BlocConsumer<SocialCubit, SocialCStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                appBar: AppBar(
                  titleSpacing: 0.0,
                  title: Row(
                    children: [
                      CircleAvatar(
                        radius: 20.0,
                        backgroundImage: NetworkImage('${userModel.images}'),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Text('${userModel.name}'),
                    ],
                  ),
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Form(
                    key: formState,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: ((context, index) {
                                var message =
                                    SocialCubit.get(context).messages[index];
                                if (SocialCubit.get(context).userModel!.uid ==
                                    message.senderid)
                                  return buildMyMessage(message);
                                return buildMessage(message);
                              }),
                              separatorBuilder: ((context, index) => SizedBox(
                                    height: 15.0,
                                  )),
                              itemCount:
                                  SocialCubit.get(context).messages.length),
                        ),
                        // buildMessage()
                        // buildMyMessage(),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            width: 1.0,
                            color: Colors.grey,
                          )),
                          child: Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: messageController,
                                  decoration: InputDecoration(
                                      border: InputBorder.none,
                                      hintText: 'type your message here .....'),
                                ),
                              ),
                              Container(
                                height: 40.0,
                                child: MaterialButton(
                                  minWidth: 1.0,
                                  color: Colors.blue,
                                  onPressed: () {
                                    // print(message)
                                    SocialCubit.get(context)
                                        .getmessags(userModel);
                                  },
                                  child: Icon(
                                    Icons.send,
                                    size: 16,
                                    color: Colors.white,
                                  ),
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

buildMessage(messageModel model) => Align(
      alignment: AlignmentDirectional.centerStart,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomEnd: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Text('${model.text}'),
        ),
      ),
    );

buildMyMessage(messageModel moel) => Align(
      alignment: AlignmentDirectional.centerEnd,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(10.0),
              topStart: Radius.circular(10.0),
              topEnd: Radius.circular(10.0),
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          child: Text('${moel.text}'),
        ),
      ),
    );
