import 'package:course/modules/social_App/bloc/bloc_cubit.dart';
import 'package:course/modules/social_App/bloc/bloc_state.dart';
import 'package:course/modules/social_App/models/classModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MessagesScreen extends StatefulWidget {
  final UserModel userDataModel;

  const MessagesScreen({
    Key? key,
    required this.userDataModel,
  }) : super(key: key);

  @override
  State<MessagesScreen> createState() => _MessagesScreenState();
}

class _MessagesScreenState extends State<MessagesScreen> {
  @override
  void initState() {
    super.initState();

    SocialCubit.get(context).getMessages(widget.userDataModel);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SocialCubit, SocialCStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              widget.userDataModel.name,
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                if (SocialCubit.get(context).messagesList.isNotEmpty)
                  Expanded(
                    child: ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        if (SocialCubit.get(context)
                                .messagesList[index]
                                .senderId ==
                            SocialCubit.get(context).user!.uid) {
                          return MyItem(
                            model: SocialCubit.get(context).messagesList[index],
                          );
                        }

                        return UserItem(
                          model: SocialCubit.get(context).messagesList[index],
                        );
                      },
                      separatorBuilder: (context, index) => SizedBox(),
                      // separatorBuilder: (context, index) =>
                      // space10Vertical(context),
                      itemCount: SocialCubit.get(context).messagesList.length,
                    ),
                  ),
                if (SocialCubit.get(context).messagesList.isEmpty)
                  const Expanded(
                    child: Center(
                      child: CupertinoActivityIndicator(
                        color: Colors.white,
                      ),
                    ),
                  ),
                // space20Vertical(context),
                TextFormField(
                  // controller: SocialCubit.get(context).messageController,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: 'type message',
                    border: const OutlineInputBorder(),
                    suffixIcon: MaterialButton(
                      minWidth: 1,
                      onPressed: () {
                        // SocialCubit.get(context).sendMessage(widget.userDataModel);
                      },
                      child: const Icon(
                        Icons.send,
                        color: Colors.teal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class MyItem extends StatelessWidget {
  final MessageDataModel model;

  const MyItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            decoration: const BoxDecoration(
              borderRadius: BorderRadiusDirectional.only(
                topStart: Radius.circular(
                  15.0,
                ),
                topEnd: Radius.circular(
                  15.0,
                ),
                bottomStart: Radius.circular(
                  15.0,
                ),
              ),
              color: Colors.teal,
            ),
            child: Text(
              model.message,
              style: const TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class UserItem extends StatelessWidget {
  final MessageDataModel model;

  const UserItem({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              borderRadius: const BorderRadiusDirectional.only(
                topStart: Radius.circular(
                  15.0,
                ),
                topEnd: Radius.circular(
                  15.0,
                ),
                bottomEnd: Radius.circular(
                  15.0,
                ),
              ),
              color: Colors.grey[200],
            ),
            child: Text(
              model.message,
              style: const TextStyle(),
            ),
          ),
        ),
        const Spacer(),
      ],
    );
  }
}
