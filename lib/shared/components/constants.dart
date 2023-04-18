import 'package:course/layout/newsApp/cubit/cubit.dart';
import 'package:course/models/preyer_time.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultButton({
  double width = double.infinity,
  required Color background,
  required Function function,
  required String text,
}) =>
    Container(
      width: width,
      child: MaterialButton(
        color: background,
        onPressed: function(),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(color: Colors.white),
        ),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: background,
      ),
    );
// NewsCubit newsCubit,

Widget defaultM(
  PrayerTimes prayerTimes,
) {
  return Container(
    // width: width,
    child: Row(
      children: [
        // Text('${prayerTimes.Asr}'),
        Spacer(),
        // Text('${prayerTimes.Asr}'),
      ],
    ),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      // color: background,
    ),
  );
}

Widget buildArticleItme(article) => Row(children: [
      Container(
        width: 120.0,
        height: 120.0,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0)),
      ),
      SizedBox(
        width: 20,
      ),
      Text(
        '${article['timings']['Fajr']}',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      )
    ]);
