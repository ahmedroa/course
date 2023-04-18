import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:course/modules/social_App/ChatDetalisScreen.dart';
import 'package:course/modules/social_App/bloc/bloc_cubit.dart';
import 'package:course/modules/social_App/models/const.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'bloc/bloc_state.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var cubit = SocialCubit.get(context).users;
    return BlocConsumer<SocialCubit, SocialCStates>(
      listener: (context, state) {},
      builder: (context, state) {
        return ConditionalBuilder(
          condition: SocialCubit.get(context).users.length > 0,
          builder: (context) => ListView.separated(
            physics: BouncingScrollPhysics(),
            itemBuilder: ((context, index) => InkWell(
                  onTap: () {
                    navigateTo(
                        context,
                        ChatDetalisScreen(
                          userModel: SocialCubit.get(context).users[index],
                        ));
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Row(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Image.network(
                            '${SocialCubit.get(context).users[index].images}',
                            width: 100,
                            height: 100,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          '${SocialCubit.get(context).users[index].name}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                )),
            separatorBuilder: ((context, index) => SizedBox()),
            itemCount: cubit.length,
          ),
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}
