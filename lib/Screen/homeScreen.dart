import 'dart:math';

import 'package:course/database/sqldb.dart';
import 'package:course/widgets/addNote.dart';
import 'package:course/widgets/editnotes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({Key? key}) : super(key: key);

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  SqlDb sqlDb = SqlDb();
  bool isloading = true;

  List notes = [];

  Future redData() async {
    List<Map> response = await sqlDb.readData('SELECT * FROM notes');
    notes.addAll(response);

    if (this.mounted) {
      isloading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    redData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('SQL'),
          centerTitle: true,
          elevation: 0.0,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: ((context) => add())));
          },
          child: Icon(Icons.add),
        ),
        body: isloading == true
            ? Center(child: Text('Loading....'))
            : Container(
                child: ListView(children: [
                ListView.builder(
                    itemCount: notes.length,
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, i) {
                      return Card(
                          child: ListTile(
                              // title: Text("${notes[i]['title']}"),
                              subtitle: Text("${notes[i]['note']}"),
                              // trailing: Text("${snaphot.data![i]['color']}"),
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                      onPressed: () async {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: ((context) =>
                                                    EditNotes(
                                                      note: notes[i]['note'],
                                                      title: notes[i]['title'],
                                                      color: notes[i]['color'],
                                                      id: notes[i]['id'],
                                                    ))));
                                      },
                                      icon: Icon(
                                        Icons.edit,
                                        color: Colors.blue,
                                      )),
                                  IconButton(
                                      onPressed: () async {
                                        int response = await sqlDb.deleteData(
                                            'DELETE FROM notes WHERE id = ${notes[i]['id']}');
                                        if (response > 0) {
                                          notes.removeWhere((element) =>
                                              element['id'] ==
                                              {notes[i]['id']});
                                          if (response > 0) {
                                            notes.removeWhere((element) =>
                                                element['id'] ==
                                                notes[i]['id']);
                                            setState(() {});
                                          }
                                        }
                                      },
                                      icon: Icon(
                                        Icons.delete,
                                        color: Colors.red,
                                      )),
                                ],
                              )));
                    })
              ])));
  }
//

}
