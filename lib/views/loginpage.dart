import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:slider_button/slider_button.dart';
import 'package:topify/assets/colors.dart';
import 'package:topify/commons/myprofile.dart';
import 'package:topify/services/getauthenticationtoken.dart';
import 'package:topify/views/dashboard.dart';
import "package:flutter_feather_icons/flutter_feather_icons.dart";
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

class LoginPage extends StatelessWidget {
  final box = GetStorage();
  void externalLink(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'There was a problem to open the url: $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: Container(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Center(
                      child: Text(
                    "Topify",
                    style: TextStyle(
                        color: pastelBrown,
                        fontWeight: FontWeight.bold,
                        fontSize: 60),
                  )),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Powerd by  "),
                      SvgPicture.asset(
                        "lib/assets/logo.svg",
                        width: 70,
                      ),
                      Text("JK dude :D")
                    ],
                  ),
                ],
              ),
              Image(
                image: AssetImage('lib/assets/images/boi.gif'),
              ),
              Center(
                child: SliderButton(
                  backgroundColor: pastelGrey,
                  action: ()async{
                    await GetAuthenticationToken.getToken();
                    if (box.read('token') != null){
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(
                              builder: (builder) => Dashboard(0)),
                          (route) => false);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          content: Text(
                              "Login failed, make sure spotify have been installed on your phone")));
                      Navigator.pushAndRemoveUntil(
                          context,
                          CupertinoPageRoute(builder: (builder) => LoginPage()),
                          (route) => false);
                    }
                  },
                  vibrationFlag: true,
                  highlightedColor: Colors.white,
                  buttonColor: pastelBrown,
                  shimmer: true,
                  label: Text(
                    "Slide to login",
                    style: TextStyle(
                        color: armyGreen,
                        fontWeight: FontWeight.w500,
                        fontSize: 17),
                    textAlign: TextAlign.start,
                  ),
                  icon: Icon(
                    FeatherIcons.logIn,
                    color: pastelCream,
                    size: 35,
                  ),
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () async {
                            externalLink(instagram);
                          },
                          icon: Icon(
                            FeatherIcons.instagram,
                            color: pastelBrown,
                          )),
                      IconButton(
                          onPressed: () async {
                            externalLink(linkedin);
                          },
                          icon: Icon(FeatherIcons.linkedin)),
                      IconButton(
                          onPressed: () async {
                            externalLink(github);
                          },
                          icon: Icon(
                            FeatherIcons.github,
                            color: pastelBrown,
                          )),
                    ],
                  ),
                  Text("Made with love <3 by kyhchn"),
                ],
              ),
            ],
          )),
        ),
      ),
    );
  }
}
