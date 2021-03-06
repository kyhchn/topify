import 'package:get_storage/get_storage.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

class GetAuthenticationToken {
  static Future<String> getAuthenticationToken() async {
    try {
      var authenticationToken = await SpotifySdk.getAuthenticationToken(
          clientId: 'da657fe9b18340c29c714b81763fcb00',
          redirectUrl: 'topify-login://callback',
          scope: 'user-top-read');
      print('succes get token');
      return authenticationToken;
    } catch (e) {
      print(e.toString());
      return "failed to get token";
    }
  }

  static Future <void> getToken() async {
    final box = GetStorage();
    String result = await GetAuthenticationToken.getAuthenticationToken();
    await box.write('token', result);
    print("token is " + result);
    await box.write('login', true);
  }
}
