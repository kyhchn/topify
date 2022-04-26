import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:topify/models/trackremote.dart';
import 'package:topify/commons/constant.dart';
import 'package:topify/services/getauthenticationtoken.dart';

class TopTracksService{
  static var client = http.Client();
  static Future<TrackRemote?> getTracks()async{
    var token = await GetStorage().read('token');
    if(token==null){
      GetAuthenticationToken.getToken();
      token = await GetStorage().read('token');
    }
    final response = await http.get(
      Uri.parse(topTrackUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
    TrackRemote res;
    if(response.statusCode == 200){
      final data = jsonDecode(response.body);
      res = TrackRemote.fromJson(data);
      print("fetch toptracks succes");
      return res;
    }else{
      print(response.statusCode);
      print("failed to fetch toptracks, trying to get new token from API");
      GetAuthenticationToken.getToken();
      return getTracks();
    }
  }
}