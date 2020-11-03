import 'package:accidentdetector/edit_contacts.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Contacts extends StatefulWidget {
  @override
  _ContactsState createState() => _ContactsState();
}

const kContactTextStyle = TextStyle(
  fontSize: 20.0,
  fontWeight: FontWeight.w400,
);

class _ContactsState extends State<Contacts> {

  String contactName;
  String contactNumber;
  String contact2Name;
  String contact2number;
  String contact3Name;
  String contact3Number;

  final keyC1Name = 'contact_name';
  final keyC1Number = 'contact_number';
  final keyC2Name = 'contact2_name';
  final keyC2Number = 'contact2_number';
  final keyC3Name = 'contact3_Name';
  final keyC3Number = 'contact3_Number';

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      contactName = prefs.getString(keyC1Name) ?? '';
      contactNumber = prefs.getString(keyC1Number) ?? '';
      contact2Name = prefs.getString(keyC2Name) ?? '';
      contact2number = prefs.getString(keyC2Number) ?? '';
      contact3Name = prefs.getString(keyC3Name) ?? '';
      contact3Number = prefs.getString(keyC3Number) ?? '';
    });
  }


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _read();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Contacts'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.userAstronaut,
                            size: 60.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Name : $contactName', style: kContactTextStyle),
                              ),
                              Container(
                                child: Text('No. : $contactNumber', style: kContactTextStyle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.userAstronaut,
                            size: 60.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Name : $contact2Name', style: kContactTextStyle),
                              ),
                              Container(
                                child: Text('No. : $contact2number', style: kContactTextStyle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.all(15.0),
                  decoration: BoxDecoration(
                    color: Colors.deepPurple,
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Container(
                          child: Icon(
                            FontAwesomeIcons.userAstronaut,
                            size: 60.0,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text('Name : $contact3Name', style: kContactTextStyle),
                              ),
                              Container(
                                child: Text('No. : $contact3Number', style: kContactTextStyle),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return EditContacts();
                  }));
                },
                child: Container(
                  height: 70.0,
                  color: Colors.pinkAccent,
                  child: Center(child: Text('Edit Contacts')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
