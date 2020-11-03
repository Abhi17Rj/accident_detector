import 'package:accidentdetector/contacts.dart';
import 'package:accidentdetector/profile.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:location/location.dart';
import 'package:sensors/sensors.dart';
import 'dart:math';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:sms_maintained/sms.dart';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(Ads());
}

class Ads extends StatefulWidget {
  @override
  _AdsState createState() => _AdsState();
}

class _AdsState extends State<Ads> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
      theme: ThemeData.dark(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int time = 15;
  int flag = 0;
  String message;
  String name;
  String bg;
  String age;
  String contact;

  SmsSender sender = new SmsSender();

  final keyName = 'profile_name';
  final keyAge = 'profile_age';
  final keyBlood = 'profile_blood';
  final keyC1Number = 'contact_number';

  _read() async {
    final prefs = await SharedPreferences.getInstance();
      name = prefs.getString(keyName);
      age = prefs.getString(keyAge);
      bg = prefs.getString(keyBlood);
      contact = prefs.getString(keyC1Number);
  }

  String displayMessage = 'SAFE';
  Color displayColor = Colors.greenAccent;

  double acceleration;
  double maxAcceleration = 0;
  double x, y, z;

  Location _location = new Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;
  LocationData _locationData;


  void getAcceleration() async{

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    accelerometerEvents.listen((event) {

      setState(() {
        x = event.x;
        y = event.y;
        z = event.z;

        double values = (x*x) + (y*y) + (z*z);

        acceleration = pow(values, 0.5);

        if (maxAcceleration < acceleration){
          maxAcceleration = acceleration;
        }

        if (acceleration > 30.0){
          accidentDetected();
        }

      });
    });


  }

  void accidentDetected() async{
    displayColor = Colors.redAccent.withOpacity(0.6);
    displayMessage = 'DANGER';
    sendMessageTimer();
    timer();
    Alert(
      context: context,
      type: AlertType.error,
      title: "Acident Detected",
      desc: "The app has detected an accident. \n Sending SOS in $time secs.",
      buttons: [
        DialogButton(
          child: Text(
            "Send",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () { flag = 1 ;_sendSMS(message, contact); Navigator.pop(context);},
          color: Color.fromRGBO(0, 179, 134, 1.0),
        ),
        DialogButton(
          child: Text(
            "Cancel",
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          onPressed: () { flag = 1; Navigator.pop(context);},
          gradient: LinearGradient(colors: [
            Color.fromRGBO(116, 116, 191, 1.0),
            Color.fromRGBO(52, 138, 199, 1.0)
          ]),
        )
      ],
    ).show();
    _locationData = await _location.getLocation();
    print(_locationData);
    message = 'Accident Detected on : \n http://maps.google.com/maps?q=${_locationData.latitude},${_locationData.longitude} \n Name : $name \n Blood Group : $bg \n Age : $age \n';
  }

  void _sendSMS(String message, String contact) async {
    SmsMessage msg = new SmsMessage(contact, message);
    msg.onStateChanged.listen((state) {
      if (state == SmsMessageState.Sent) {
        print("SMS is sent!");
      } else if (state == SmsMessageState.Delivered) {
        print("SMS is delivered!");
      }
    });
    sender.sendSms(msg);
    print(message);
  }

  void sendMessageTimer() {
    Timer(Duration(seconds: 15), () {
      if (flag == 0){
        _sendSMS(message, contact);
      }
    });
  }
  void timer() {
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        time -= 1;
        if (time <= 0){
          timer.cancel();
        }
        print(time);
      });
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _read();
    getAcceleration();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Accident Detector'),
      ),
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex: 14,
                child: Container(
                  margin: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    border: Border.all(
                      color: Colors.white,
                    ),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            color: displayColor.withOpacity(0.6),
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                              color: Colors.white,
                            ),
                          ),
                          width: 200.0,
                          height: 60.0,
                          padding: EdgeInsets.all(15.0),
                          child: Center(
                            child: Text(
                              displayMessage,
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('X : $x '),
                            Text('Y : $y'),
                            Text('Z : $z'),
                          ],
                        ),
                        Text('Acceleration : $acceleration'),
                        Text('Max-Acceleration : $maxAcceleration'),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 7,
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Material(
                          elevation: 5,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Contacts();
                              }));
                            },
                            child: Container(
                              margin: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    FontAwesomeIcons.userFriends,
                                    size: 50.0,
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Contacts',
                                  ),
                                ],
                              )
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Material(
                          elevation: 5,
                          child: GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context){
                                return Profile();
                              }));
                            },
                            child: Container(
                              margin: EdgeInsets.all(20.0),
                              decoration: BoxDecoration(
                                color: Colors.pinkAccent.withOpacity(0.6),
                                borderRadius: BorderRadius.circular(30.0),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Hero(
                                    tag: 'user',
                                    child: Icon(
                                      FontAwesomeIcons.user,
                                      size: 50.0,
                                    ),
                                  ),
                                  SizedBox(height: 10.0),
                                  Text(
                                    'Profile',
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}


