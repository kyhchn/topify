import 'package:get/get.dart';
import 'package:topify/models/trackremote.dart';
import 'package:topify/services/toptracks_service.dart';

class TopTracksController extends GetxController{
  
  @override
  void onInit() {
    // TODO: implement onInit
    fetchTracks();
    super.onInit();
  }
  var isLoading = true.obs;
  var tracks = TrackRemote(limit: 0).obs;
  void fetchTracks()async{
    try {
      isLoading(true);
      var result = await TopTracksService.getTracks();
      if(result!=null){
        tracks.value = result;
      }
    } catch (e) {
      print(e.toString());
    }finally{
      isLoading(false);
    }
  }
}