import 'dart:io' show Platform;

class Constant {

static const REFRESH_TOKEN_KEY = 'refresh_token';
static const BACKEND_TOKEN_KEY = 'backend_token';
static const GOOGLE_ISSUER = 'https://accounts.google.com';
static const GOOGLE_CLIENT_ID_IOS = '<IOS-CLIENT-ID>';
static const GOOGLE_REDIRECT_URI_IOS = 'com.googleusercontent.apps.<IOS-CLIENT-ID>.apps.googleusercontent.com:/oauthredirect';
static const GOOGLE_CLIENT_ID_ANDROID = '<ANDROID-CLIENT-ID>';
static const GOOGLE_REDIRECT_URI_ANDROID = 'com.googleusercontent.apps.<ANDROID-CLIENT-ID>.apps.googleusercontent.com:/oauthredirect';

static String clientID() {
  if(Platform.isAndroid) {
    return GOOGLE_CLIENT_ID_ANDROID;
  } else if (Platform.isIOS) {
    return GOOGLE_CLIENT_ID_IOS;
  }
  return '';
}

static String redirectUrl() {
  if(Platform.isAndroid) {
    return GOOGLE_REDIRECT_URI_ANDROID;
  } else if (Platform.isIOS) {
    return GOOGLE_REDIRECT_URI_IOS;
  }
  return '';
}
}
