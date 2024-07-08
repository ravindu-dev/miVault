import 'dart:io' show Platform;

class Constant {

static const REFRESH_TOKEN_KEY = 'refresh_token';
static const BACKEND_TOKEN_KEY = 'backend_token';
static const GOOGLE_ISSUER = 'https://accounts.google.com';
static const GOOGLE_CLIENT_ID_IOS = '26382969981-i6shbfashvvchkecbl4s88tlejr317nf.apps.googleusercontent.com';
static const GOOGLE_REDIRECT_URI_IOS = 'com.googleusercontent.apps.26382969981-i6shbfashvvchkecbl4s88tlejr317nf.apps.googleusercontent.com:/oauthredirect';
static const GOOGLE_CLIENT_ID_ANDROID = '26382969981-7uh9i2oncd8ajd7l1r66ft0rbf73oc3t.apps.googleusercontent.com';
static const GOOGLE_REDIRECT_URI_ANDROID = 'com.googleusercontent.apps.26382969981-7uh9i2oncd8ajd7l1r66ft0rbf73oc3t.apps.googleusercontent.com:/oauthredirect';

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