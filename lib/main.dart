import 'package:connectivity/connectivity.dart';
import 'package:data/core/local_storage.dart';
import 'package:data/core/remote_api.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:symex_mobile_v2/injection_container.dart';
import 'package:symex_mobile_v2/root_widget.dart';

void main() {
  configureDependencies();
  runApp(RootWidget());
}

Future<void> callApi() async {
  var s = await SharedPreferences.getInstance();
  // This call to setState tells the Flutter framework that something has
  // changed in this State, which causes it to rerun the build method below
  // so that the display can reflect the updated values. If we changed
  // _counter without calling setState(), then the build method would not be
  // called again, and so nothing would appear to happen.
  //
  var api = RemoteApiImpl(Dio(), Connectivity(), LocalStorageImpl(s));

  api.apiGet('https://jsonplaceholder.typicode.com/posts/1');
}
