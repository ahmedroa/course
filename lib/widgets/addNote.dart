import 'package:course/Screen/homeScreen.dart';
import 'package:course/database/sqldb.dart';
import 'package:flutter/material.dart';

class add extends StatefulWidget {
  @override
  State<add> createState() => _addState();
}

class _addState extends State<add> {
  Widget build(BuildContext context) {
    GlobalKey<FormState> formstate = GlobalKey();

    TextEditingController note = TextEditingController();

    TextEditingController title = TextEditingController();

    TextEditingController color = TextEditingController();
    // SqlDb sqlDb = SqlDb();
    SqlDb sqlDb = SqlDb();

    String selectedTime = "Pick Time";

    displayTimeDialog() async {
      final TimeOfDay? time =
          await showTimePicker(context: context, initialTime: TimeOfDay.now());
      if (time != null) {
        setState(() {
          selectedTime = time.format(context);
        });
      }
    }

    return Scaffold(
      appBar: AppBar(
        // backgroundColor: kBackgroundColor,
        title: Text('Add Notes'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              Form(
                  key: formstate,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: note,
                        decoration: InputDecoration(hintText: 'note'),
                      ),
                      TextFormField(
                        controller: title,
                        decoration: InputDecoration(hintText: 'title'),
                      ),
                      TextFormField(
                        controller: color,
                        decoration: InputDecoration(hintText: 'color'),
                      ),
                      Container(
                        height: 20,
                      ),
                      MaterialButton(
                        textColor: Colors.white,
                        color: Colors.blue,
                        onPressed: () async {
                          int response = await sqlDb.insertData('''
                              INSERT INTO notes (note, title , color) 
                              VALUES ( "${note.text}" , "${title.text}" , "${color.text}" )
                              ''');
                          print('respose====================');
                          print(response);
                          if (response > 0) {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                  builder: (context) => homeScreen(),
                                ),
                                ((route) => false));
                          }
                        },
                        child: Text('Add note'),
                      ),
                      TextButton(
                        onPressed: () {
                          displayTimeDialog();
                        },
                        child: Text(
                          selectedTime != null
                              ? '$selectedTime'
                              : 'Click Below Button To Select Time...',
                          style: const TextStyle(fontSize: 24),
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
