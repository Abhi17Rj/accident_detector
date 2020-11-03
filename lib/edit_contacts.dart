import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditContacts extends StatefulWidget {
  @override
  _EditContactsState createState() => _EditContactsState();
}

class _EditContactsState extends State<EditContacts> {

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

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(keyC1Name, contactName);
    prefs.setString(keyC1Number, contactNumber);
    prefs.setString(keyC2Name, contact2Name);
    prefs.setString(keyC2Number, contact2number);
    prefs.setString(keyC3Name, contact3Name);
    prefs.setString(keyC3Number, contact3Number);
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
        title: Text('Edit Contacts'),
      ),
      body: SafeArea(
        child: Container(
          child: ListView(
                children: [
                  Container(
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Contact 1',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                          child: TextField(
                            onChanged: (value){
                              contactName = value;
                            },
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.all(5.0),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Name : $contactName',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                          child: TextField(
                            onChanged: (value){
                              contactNumber = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Contact Number : $contactNumber',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Contact 2',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                          child: TextField(
                            onChanged: (value){
                              contact2Name = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Name : $contact2Name',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                          child: TextField(
                            onChanged: (value){
                              contact2number = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Contact Number : $contact2number',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(15.0),
                    padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple,
                      borderRadius: BorderRadius.circular(20.0),
                      border: Border.all(color: Colors.grey),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Contact 3',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                          child: TextField(
                            onChanged: (value){
                              contact3Name = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Name : $contact3Name',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 5.0),
                          child: TextField(
                            onChanged: (value){
                              contact3Number = value;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.0),
                                borderSide: BorderSide.none,
                              ),
                              filled: true,
                              fillColor: Colors.white,
                              hintText: 'Contact Number : $contact3Number',
                              hintStyle: TextStyle(
                                color: Colors.grey,
                              ),
                            ),
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      _save();
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 70.0,
                      color: Colors.pinkAccent,
                      child: Center(child: Text('SAVE')),
                    ),
                  ),
                ],
              ),


        ),
      ),
    );
  }
}
