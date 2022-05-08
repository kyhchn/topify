import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:topify/views/dashboard.dart';
import 'package:topify/views/loginpage.dart';
import 'package:topify/views/widgets/toptracks.dart';
import 'package:vibration/vibration.dart';

class LogOutPage extends StatelessWidget {
  const LogOutPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      
      title: Text('Alert'),
      content: Text('Are you sure to log out??'),
      actions: [
        TextButton(
          onPressed: () {
            Vibration.vibrate(duration: 500, amplitude: 128);
            TopTracks.dispose();
            GetStorage().erase();
            Navigator.pushAndRemoveUntil(
              context,
              CupertinoPageRoute(builder: (build) => LoginPage()),
              (route) => false);
          },
          child: Text('Yes'),
        ),
        TextButton(onPressed: ()=>Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Dashboard(0)), (route) => false), child: Text("No"))
      ],
    );
  }
}
