import 'package:flutter/material.dart';

class Messenger extends StatelessWidget {
  const Messenger({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        titleSpacing: 20, // padding
        backgroundColor: Colors.white,
        elevation: 0.0, // حدة اللون
        title: Row(
          children: [
            CircleAvatar(
              radius: 20,
              backgroundImage: NetworkImage(
                  "https://pbs.twimg.com/profile_images/1502340667221192707/3613bIPM_400x400.jpg"),
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "chats",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        actions: [
          IconButton(
              onPressed: null,
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.camera_alt,
                  color: Colors.black,
                  size: 25,
                ),
              )),
          IconButton(
              onPressed: null,
              icon: CircleAvatar(
                radius: 15.0,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.edit,
                  color: Colors.black,
                  size: 25,
                ),
              )),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[300]),
              child: Row(
                children: [
                  Icon(Icons.search),
                  SizedBox(
                    height: 15,
                  ),
                  Text("search"),
                ],
              ), 
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              height: 90.0,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => bulidStoryItme(),
                itemCount: 30,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context, index) => buliedchatItem(),
              separatorBuilder: (context, index) => SizedBox(height: 20.0),
              itemCount: 100,
            )
          ]),
        ),
      ),
    );
  }

  Widget buliedchatItem() => Row(
        children: [
          Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                    "https://pbs.twimg.com/profile_images/1502340667221192707/3613bIPM_400x400.jpg"),
              ),
              CircleAvatar(
                radius: 7.0,
                backgroundColor: Colors.red,
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ahmed khalid",
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(
                  height: 5.0,
                ),
                Row(
                  children: [
                    Expanded(
                        child: Text(
                      "Hello, my name is Ahmed khalid",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    )),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: BoxDecoration(
                            color: Colors.blue, shape: BoxShape.circle),
                      ),
                    ),
                    Text("02.00 PM"),
                  ],
                ),
              ],
            ),
          ),
        ],
      );

  Widget bulidStoryItme() => Container(
        width: 60,
        child: Column(
          children: [
            Stack(
              alignment: AlignmentDirectional.bottomEnd,
              children: [
                CircleAvatar(
                  radius: 25,
                  backgroundImage: NetworkImage(
                      "https://pbs.twimg.com/profile_images/1502340667221192707/3613bIPM_400x400.jpg"),
                ),
                CircleAvatar(
                  radius: 7.0,
                  backgroundColor: Colors.red,
                ),
              ],
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              "ahmed khalid ramadan",
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            )
          ],
        ),
      );
}
