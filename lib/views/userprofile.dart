import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:topify/controllers/profilecontroller.dart';

class UserProfile extends StatelessWidget {
  final ProfileController _profileController = Get.put(ProfileController());
  @override
  String getProfileName(){
    String res = "";
    if(_profileController.profile.value.displayName!=null){
      res = _profileController.profile.value.displayName!;
    }
    return res;
  }
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Center(child: Obx((){
        return Text(getProfileName());
      }),)
    );
  }
}