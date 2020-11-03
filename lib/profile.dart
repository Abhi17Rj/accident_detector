import 'package:accidentdetector/edit_profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

const kStyleText = TextStyle(
  fontWeight: FontWeight.w400,
  fontSize: 22.0,
  fontStyle: FontStyle.italic,
);

class _ProfileState extends State<Profile> {

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
      name = prefs.getString(keyName);
      age = prefs.getString(keyAge);
      bloodGroup = prefs.getString(keyBlood);
      weight = prefs.getString(keyWeight);
      address = prefs.getString(keyAdd);
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
        title: Text('Profile'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(height: 1.0,),
                      CircleAvatar(
                        radius: 80.0,
                        backgroundColor: Colors.deepPurple,
                        child: Hero(
                          tag: 'user',
                          child: Icon(
                            FontAwesomeIcons.user,
                            size: 80.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Text('Name : $name', style: kStyleText,),
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Text('Blood Group : $bloodGroup', style: kStyleText,),
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Text('Age : $age', style: kStyleText,),
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Text('Weight : $weight', style: kStyleText,),
                            ),
                            Container(
                              margin: EdgeInsets.all(8.0),
                              child: Text('Address: $address', style: kStyleText,),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: (){
                  var isChanged = Navigator.push(context, MaterialPageRoute(builder: (context){
                    return EditProfile();
                  }));

                  if (isChanged != null){
                    _read();
                  }
                },
                child: Container(
                  height: 70.0,
                  color: Colors.pinkAccent,
                  child: Center(child: Text('Edit Profile')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
