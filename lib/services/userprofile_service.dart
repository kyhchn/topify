import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:topify/commons/constant.dart';
import 'package:topify/models/profileremote.dart';
import 'package:topify/services/getauthenticationtoken.dart';

class UserProfileService {
  static var client = http.Client();
  static Future<ProfileRemote?> getUserProfile() async {
    var token = await GetStorage().read('token');
    if (token == null) {
      GetAuthenticationToken.getToken();
      token = await GetStorage().read('token');
      
    }
    final response = await http.get(
      Uri.parse(profileUrl),
      headers: {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token',
      }
    );
    ProfileRemote res;
    if(response.statusCode ==200){
      final data = jsonDecode(response.body);
      res = ProfileRemote.fromJson(data);
      print("fetch profile succes\n");
      return res;
    }else{
      print(response.statusCode);
      print("failed to fetch profile, trying to get new token");
      GetAuthenticationToken.getToken();
      return getUserProfile();
    }
  }
}
