// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// class AddTaskScreen extends StatelessWidget {
//   const AddTaskScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     GlobalKey<FormState> formstate = GlobalKey();

//     TextEditingController note = TextEditingController();

//     TextEditingController title = TextEditingController();

//     TextEditingController color = TextEditingController();


//     return Container(
//       child: Padding(
//         padding: const EdgeInsets.all(30.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text('مهمة جديدة',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                   color: Colors.indigo[400],
//                   fontWeight: FontWeight.bold,
//                   fontSize: 30,
//                 )),
//             TextFormField(
//               controller: note,
//               autofocus: true,
//               decoration: InputDecoration(hintText: 'note'),
//             ),
//             Row(
//               children: [
//                 Container(
//                   decoration: BoxDecoration(),
//                   child: TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'تصنيف',
//                         style: TextStyle(
//                           color: Colors.black,
//                         ),
//                       )),
//                 ),
//                 IconButton(
//                     // color: Colors.white,
//                     onPressed: () {},
//                     icon: Icon(Icons.telegram)),
//               ],
//             ),
//             TextButton(
//               onPressed: () async {
//                 int response = await sqlDb.insertData('''
//                               INSERT INTO notes (note, title , color) 
//                               VALUES ( "${note.text}" , "${title.text}" , "${color.text}" )
//                               ''');
//                 print('respose====================');
//                 print(response);
//                 if (response > 0) {
//                   Navigator.of(context).pushAndRemoveUntil(
//                       MaterialPageRoute(
//                         builder: (context) => home(),
//                       ),
//                       ((route) => false));
//                 }
//               },
//               child: Text('Add',
//                   style: TextStyle(
//                     color: Colors.white,
//                     fontSize: 20,
//                   )),
//               style: TextButton.styleFrom(backgroundColor: kBackgroundColor),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
