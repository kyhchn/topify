import 'package:get/get.dart';
import 'package:topify/models/profileremote.dart';
import 'package:topify/services/userprofile_service.dart';

class ProfileController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    fetchprofile();
    super.onInit();
  }
  var isLoading = true.obs;
  var profile = ProfileRemote().obs;
  fetchprofile() async{
    try {
      isLoading(true);
      var result =  await UserProfileService.getUserProfile();
      if(result!=null){
        profile.value = result;
        print('fetch profile success');
      }
    } catch (e) {
      print(e.toString());
    }finally{
      isLoading(false);
    }
  }
}