import 'dart:convert';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:topify/commons/constant.dart';
import 'package:topify/models/playlistremote.dart';
import 'package:topify/models/profileremote.dart';
import 'package:topify/services/getauthenticationtoken.dart';

class PlaylistService {
  static Future<PlaylistRemote?> getProfile() async {
    var token = await GetStorage().read('token');
    if (token == null) {
      GetAuthenticationToken.getAuthenticationToken();
      token = await GetStorage().read('token');
    }
    final response = await http.get(Uri.parse(playlistUrl), headers: {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token',
    });
    PlaylistRemote res;
    if (response.statusCode == 200) {
      final data = jsonDecode(response.body);
      res = PlaylistRemote.fromJson(data);
      print('success to fetch playlist');
      return res;
    } else {
      print(response.statusCode);
      print('failed to fetch playlist, try to get new token from API');
      return getProfile();
    }
  }
}
