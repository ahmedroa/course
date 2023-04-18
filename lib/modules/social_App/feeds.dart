import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class feeds extends StatelessWidget {
  const feeds({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 10,
          margin: EdgeInsets.all(8),
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              Image(
                image: NetworkImage(
                    'https://pbs.twimg.com/profile_images/1534269732773408769/E_cXOiuD_400x400.jpg'),
                fit: BoxFit.cover,
                width: double.infinity,
                height: 260,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Communicate with friends',
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          ),
        ),
        Card(
            elevation: 10,
            margin: EdgeInsets.symmetric(horizontal: 8),
            clipBehavior: Clip.antiAliasWithSaveLayer,
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      radius: 25.0,
                      backgroundImage: NetworkImage(
                          'https://pbs.twimg.com/profile_images/1534269732773408769/E_cXOiuD_400x400.jpg'),
                    )
                  ],
                )
              ],
            )),
      ],
    );
  }
}
