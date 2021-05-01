import 'package:data/core/remote_api.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class SplashScreenController extends GetxController {
  final RemoteApi remoteApi;

  SplashScreenController(this.remoteApi) {
    callApi();
  }
  Future<void> callApi() async {
    var s = await SharedPreferences.getInstance();
    // This call to setState tells the Flutter framework that something has
    // changed in this State, which causes it to rerun the build method below
    // so that the display can reflect the updated values. If we changed
    // _counter without calling setState(), then the build method would not be
    // called again, and so nothing would appear to happen.
    //

    remoteApi.apiGet('https://jsonplaceholder.typicode.com/postsgg/1');
  }
}
