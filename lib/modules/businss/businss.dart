import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:course/layout/newsApp/cubit/cubit.dart';
import 'package:course/layout/newsApp/cubit/satates.dart';
import 'package:course/shared/bloc/cubit_bloc.dart';
import 'package:course/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class businss extends StatelessWidget {
  const businss({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit, NewsStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var list = NewsCubit.get(context);
        return ConditionalBuilder(
          condition: State is! GetApiLpLodingsState,
          builder: ((context) => ListView.separated(
                physics: BouncingScrollPhysics(),
                itemBuilder: (context, index) => Column(
                  children: [
                    Text('${NewsCubit.get(context).prayerTimes?.fajr}'),
                    Text('${NewsCubit.get(context).prayerTimes?.asr}'),
                    Text('${NewsCubit.get(context).prayerTimes?.dhuhr}'),
                    Text('${NewsCubit.get(context).prayerTimes?.maghrib}'),
                    Text('${NewsCubit.get(context).prayerTimes?.isha}'),
                    // buildArticleItme (list[index]),
                  ],
                ),
                separatorBuilder: (context, index) => SizedBox(),
                itemCount: 1,
              )),
          fallback: ((context) => Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}
