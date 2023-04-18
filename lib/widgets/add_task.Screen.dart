import 'package:course/Screen/homeScreen.dart';
import 'package:course/layout/home_layout.dart';
import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

import '../database/sqldb.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  GlobalKey<FormState> formstate = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();
  TextEditingController timee = TextEditingController();
  TextEditingController datee = TextEditingController();
  SqlDb sqlDb = SqlDb();
  var timeController = TextEditingController();
  var DateController = TextEditingController();
  var formkey = GlobalKey<FormState>();
  //  var titleController = TextEditingController();
  // var dateController = TextEditingController();
  var Scaffoldkey = GlobalKey<ScaffoldState>();

  // SqlDb sqlDb = SqlDb();

  String selectedTime = "Pick Time";
  var time;
  @override
  void initState() {
    time = TimeOfDay.now();
    super.initState();
  }

  _pickTime() async {
    TimeOfDay? t = await showTimePicker(context: context, initialTime: time);
    if (t != null)
      setState(() {
        time = t;
        selectedTime =
            "Selected Time : ${t.hour.toString()}:${t.minute.toString()}";
      });
  }

  _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
  }

  DateTime _dateTime = DateTime(2100);
  DateTime date = DateTime(2022, 12, 24);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Form(
          key: formkey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text('مهمة جديدة',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.indigo[400],
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  )),
              defaultTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Tasks Must be not  empty';
                  }
                  return null;
                },
                controller: note,
                keyboaredType: TextInputType.text,
                Label: 'Tasks title',
                prefix: Icons.title,
              ),
              SizedBox(
                height: 15.0,
              ),
              defaultTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Date Must be not empty';
                  }
                  return null;
                },
                controller: datee,
                keyboaredType: TextInputType.datetime,
                Label: 'Date',
                prefix: Icons.calendar_month,
                ontap: () {
                  showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime.now(),
                          lastDate: DateTime.parse('2030-01-01'))
                      .then((value) => {
                            datee.text = DateFormat.yMMMd().format(value!),
                          });
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              defaultTextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'time must be not empty';
                  }
                  return null;
                },
                controller: timee,
                keyboaredType: TextInputType.datetime,
                Label: 'Date',
                prefix: Icons.watch,
                ontap: () {
                  showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  ).then(
                    (value) => {
                      print(value!.format(context)),
                      timee.text = value.format(context).toString(),
                    },
                  );
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              MaterialButton(
                textColor: Colors.blue,
                // color: kBackgroundColor,
                onPressed: () async {
                  int response = await sqlDb.insertData('''
                              INSERT INTO notes ("note" , "title" , 
                                       "color" , "timee" , "datee" ) 
                                      VALUES ( "${note.text}" , "${title.text}" ,
                               "${color.text}" , "${timee.text}" , "${datee.text}"
                                )
                              ''');
                  print('respose====================');
                  print(response);
                  if (response > 0) {
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => HomeLayout(),
                        ),
                        ((route) => false));
                  }
                },
                child: Text('Add note'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget defaultTextFormField(
    {required TextEditingController controller,
    required TextInputType keyboaredType,
    required IconData prefix,
    required String Label,
    required FormFieldValidator validator,
    Function? onSubmitted,
    GestureTapCallback? ontap,
    IconData? suffix,
    bool? obsecure = false,
    bool isClickable = true}) {
  return TextFormField(
    controller: controller,
    keyboardType: keyboaredType,
    obscureText: obsecure!,
    enabled: isClickable,
    maxLines: 1,
    enableSuggestions: true,
    onFieldSubmitted: (s) {
      onSubmitted!();
    },
    onTap: ontap,
    validator: validator,
    decoration: InputDecoration(
      prefixIcon: Icon(prefix),
      suffixIcon: Icon(suffix),
      labelText: Label,
      border: OutlineInputBorder(),
    ),
  );
}
