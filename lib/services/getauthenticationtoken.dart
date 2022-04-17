import 'package:spotify_sdk/spotify_sdk.dart';
class GetAuthenticationToken{

  static Future<String> getAuthenticationToken() async {
    try {
      var authenticationToken = await SpotifySdk.getAuthenticationToken(
          clientId: 'da657fe9b18340c29c714b81763fcb00',
          redirectUrl: 'topify-login://callback',
          scope: 'app-remote-control, '
              'user-modify-playback-state, '
              'playlist-read-private, '
              'user-top-read');
      return authenticationToken;
    }catch(e){
      print(e.toString());
      return "failed to get token";
    }
  }
}