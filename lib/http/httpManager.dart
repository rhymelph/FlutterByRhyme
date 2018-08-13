import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

typedef InterceptorCallback();
typedef InterceptorErrorCallback(Object e);
typedef InterceptorsSuccessCallback(String body);

get(
    {@required String url,
      InterceptorCallback onSend,
      InterceptorsSuccessCallback onSuccess,
      InterceptorErrorCallback onError}) async {
  onSend();
  try {
    await http.get(url).then(
          (http.Response response) {
        onSuccess(response.body);
      },
    ).catchError((){
      onError(null);
    });
  }  catch (e) {
    onError(e);
  }
}