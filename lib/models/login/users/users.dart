// import 'package:flutter/material.dart';

// // import '../../../modules/user/user_model.dart';

// class Users extends StatelessWidget {
//   // const Users({Key? key}) : super(key: key);
//   List<UserModel> users = [
//     UserModel(id: 1, name: "ahmed", phone: "+249111452374"),
//     UserModel(id: 2, name: "ali", phone: "+249111472354"),
//     UserModel(id: 3, name: "omer", phone: "+249111452374"),
//     UserModel(id: 4, name: "khalid", phone: "+249181472374"),
//     UserModel(id: 5, name: "reem", phone: "+249115472374"),
//     UserModel(id: 6, name: "saad", phone: "+249115472374"),
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('users'),
//       ),
//       body: ListView.separated(
//         itemBuilder: (context, index) => bulidUserItme(users[index]),
//         separatorBuilder: ((context, index) => Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 width: 1.0,
//                 color: Colors.grey[300],
//               ),
//             )),
//         itemCount: users.length,
//       ),
//     );
//   }

//   Widget bulidUserItme(UserModel user) => Padding(
//         padding: const EdgeInsets.all(12.0),
//         child: Row(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             CircleAvatar(
//               radius: 25,
//               child: Text(
//                 "{$users.id}",
//                 style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//               ),
//             ),
//             SizedBox(
//               width: 20.0,
//             ),
//             Column(
//               mainAxisSize: MainAxisSize.min, // مهم
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "{$users.name}",
//                   style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
//                 ),
//                 Text(
//                   "{$users.phone}",
//                   style: TextStyle(color: Colors.grey),
//                 )
//               ],
//             ),
//           ],
//         ),
//       );
// }
