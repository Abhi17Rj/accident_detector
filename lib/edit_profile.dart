import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {

  String name;
  String age;
  String bloodGroup;
  String weight;
  String address;

  final keyName = 'profile_name';
  final keyAge = 'profile_age';
  final keyBlood = 'profile_blood';
  final keyWeight = 'profile_weight';
  final keyAdd = 'profile_add';

  _read() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      name = prefs.getString(keyName) ?? '';
      age = prefs.getString(keyAge) ?? '';
      bloodGroup = prefs.getString(keyBlood) ?? '';
      weight = prefs.getString(keyWeight) ?? '';
      address = prefs.getString(keyAdd) ?? '';
    });
  }

  _save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString(keyName, name);
    prefs.setString(keyBlood, bloodGroup);
    prefs.setString(keyAdd, address);
    prefs.setString(keyAge, age);
    prefs.setString(keyWeight, weight);
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
        title: Text('Edit Profile'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                child: Expanded(
                  child: ListView(
                    itemExtent: 100.0,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                        child: TextField(
                          onChanged: (value){
                            name = value;
                          },
                          decoration: InputDecoration(
                            prefixText: 'Name :',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '$name',
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
                        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                        child: TextField(
                          onChanged: (value){
                            bloodGroup = value;
                          },
                          decoration: InputDecoration(
                            prefixText: 'BG : ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '$bloodGroup',
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
                        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                        child: TextField(
                          onChanged: (value){
                            age = value;
                          },
                          decoration: InputDecoration(
                            prefixText: 'Age : ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '$age',
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
                        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                        child: TextField(
                          onChanged: (value){
                            weight = value;
                          },
                          decoration: InputDecoration(
                            prefixText: 'Weight :',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '$weight',
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
                        margin: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
                        child: TextField(
                          onChanged: (value){
                            address = value;
                          },
                          decoration: InputDecoration(
                            prefixText: 'Add : ',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15.0),
                              borderSide: BorderSide.none,
                            ),
                            filled: true,
                            fillColor: Colors.white,
                            hintText: '$address',
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
              ),
              GestureDetector(
                onTap: (){
                  _save();
                  Navigator.pop(context, 'Yes');
                },
                child: Container(
                  height: 70.0,
                  color: Colors.pinkAccent,
                  child: Center(child: Text('SAVE')),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
