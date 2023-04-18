import 'package:course/Networks/remote/dio.dart';
import 'package:course/models/preyer_time.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class testttt extends StatefulWidget {
  const testttt({Key? key}) : super(key: key);

  @override
  State<testttt> createState() => _testttttState();
}

class _testttttState extends State<testttt> {
  @override
  List<Map> business = [];

  void getData() {
    DioHelper.getData(
      url: 'v1/calendarByCity',
      query: {
        'country': 'SA',
        'city': 'akkah alMuKaramah',
      },
    ).then((value) {
      print(value.data['data'][0]['timings']);
      PrayerTimes.fromJson(value.data);
      business = value.data['data'];
    }).catchError((error) {
      print(error.toString());
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    getData();

    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
        ),
        body: ListView.builder(
            itemCount: business.length,
            itemBuilder: ((context, index) {
              return Text(
                '${business.length}',
                style: TextStyle(color: Colors.black),
              );
            })));
  }
}

// import 'package:course/Networks/remote/dio.dart';
// import 'package:course/layout/newsApp/cubit/cubit.dart';
// import 'package:course/layout/newsApp/cubit/satates.dart';
// import 'package:course/models/preyer_time.dart';
// import 'package:course/modules/Sports/sports.dart';
// import 'package:course/modules/businss/businss.dart';
// import 'package:course/modules/sciense/sciense.dart';
// import 'package:course/modules/sciense/settings.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class NewsCubit extends Cubit<NewsStates> {
//   NewsCubit() : super(NewInitialState());

//   static NewsCubit get(context) => BlocProvider.of(context);

//   int currentIndex = 0;

//   List<BottomNavigationBarItem> bottomItems = [
//     BottomNavigationBarItem(
//         icon: Icon(
//           Icons.business,
//         ),
//         label: 'busines'),
//     BottomNavigationBarItem(
//         icon: Icon(
//           Icons.sports,
//         ),
//         label: 'sports'),
//     BottomNavigationBarItem(
//         icon: Icon(
//           Icons.science,
//         ),
//         label: 'science'),
//     BottomNavigationBarItem(
//         icon: Icon(
//           Icons.settings,
//         ),
//         label: 'settings'),
//   ];
//   List<Widget> Screens = [
//     businss(),
//     Sports(),
//     sciense(),
//     settings(),
//   ];

//   void chengeBottomNavBar(int index) {
//     currentIndex = index;
//     emit(NewBottonNavlState());
//   }

//   List<dynamic> business = [];

//   void getData() {
//     emit(GetApiLpLodingsState());
//     DioHelper.getData(
//       url: 'v1/calendarByCity',
//       query: {
//         'country': 'SA',
//         'city': 'akkah alMuKaramah',
//       },
//     ).then((value) {
//       business = value.data['data'];
//       print(business);
//       // print(value.data['data'][0]['timings']
//       // );

//       // PrayerTimes.fromJson(value.data()!);
//       // business = value.data['data'][0]['timings'];
//       // business = value.data['data'];

//       emit(GetApiSuccessState());
//     }).catchError((error) {
//       emit(GetApiErrorState(error.toString()));
//       print(error.toString());
//     });
//     emit(state);
//   }
// }
