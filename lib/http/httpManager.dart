import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

typedef InterceptorCallback();
typedef InterceptorErrorCallback(dynamic e);
typedef InterceptorsSuccessCallback(dynamic body);
typedef InterceptorDoneCallback(dynamic done);

get(
    {@required String url,
    Map<String, String> headers,
    InterceptorCallback onSend,
    InterceptorsSuccessCallback onSuccess,
    InterceptorErrorCallback onError}) async {
  onSend();
  try {
    await http.get(url, headers: headers).then(
      (http.Response response) {
        onSuccess(response.body);
      },
    ).catchError(() {
      onError(null);
    });
  } catch (e) {
    onError(e);
  }
}

post(
    {@required String url,
    Map<String, String> headers,
    dynamic body,
    InterceptorCallback onSend,
    InterceptorsSuccessCallback onSuccess,
    InterceptorErrorCallback onError}) {
  onSend();
  try {
    http.post(url, body: body).then(
      (http.Response response) {
        onSuccess(response.body);
      },
    ).catchError((error, stack) {
      onError(error);
    });
  } catch (e) {
    onError(e);
  }
}

webSocket(
    {@required String url,
    Map<String, String> headers,
    Iterable<String> protocols,
    InterceptorCallback onSend,
    InterceptorsSuccessCallback onSuccess,
    InterceptorErrorCallback onError,
    InterceptorDoneCallback onDone}) {
  onSend();
  try {
    WebSocket.connect(url, protocols: protocols, headers: headers)
        .then((WebSocket webSocket) {
      onSuccess(webSocket);
      webSocket.done.then(onDone);
    }).catchError((error, stack) {
      onError(error);
    });
  } catch (e) {
    onError(e);
  }
}
