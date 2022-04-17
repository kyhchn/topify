import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:topify/models/trackremote.dart';
import 'package:topify/constant.dart';
import 'package:topify/services/getauthenticationtoken.dart';

class TopTracksService{
  static void getToken()async{
    final box = GetStorage();
    String result = await GetAuthenticationToken.getAuthenticationToken();
    await box.write('token', result);
    print(result);
  }
  static var client = http.Client();
  static Future<TrackRemote?> getTracks(String range)async{
    getToken();
    final token = await GetStorage().read('token');
    final response = await http.get(
      Uri.parse(url),
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
      print("fetch succes");
      return res;
    }else{
      print(response.statusCode);
      print("failed to fetch");
      return null;
    }
  }
}