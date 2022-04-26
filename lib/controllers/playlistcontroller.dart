import 'package:get/get.dart';
import 'package:topify/models/playlistremote.dart';
import 'package:topify/services/playlist_service.dart';

class PlaylistController extends GetxController{
  @override
  void onInit() {
    // TODO: implement onInit
    fetchPlaylist();
    super.onInit();
  }
  var isLoading = true.obs;
  var Playlist = PlaylistRemote().obs;
  fetchPlaylist()async{
    try {
      isLoading(true);
      var result = await PlaylistService.getProfile();
      if(result!=null){
        Playlist.value = result;
        print('fetch playlist success');
      }
    } catch (e) {
      print(e.toString());
    }finally{
      isLoading(false);
    }
  }
}