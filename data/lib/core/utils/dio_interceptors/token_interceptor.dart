import 'package:data/core/api_endpoints.dart';
import 'package:data/core/local_storage.dart';
import 'package:dio/dio.dart';

const USER_TOKEN = 'user_token';
const TOKEN_HEADER = 'bearer_token';

class TokenInterceptor extends Interceptor {
  final Dio dio;
  final LocalStorage localStorage;
  final Dio tokenDio;

  TokenInterceptor(this.dio, this.localStorage, this.tokenDio);

  @override
  void onError(DioError error, ErrorInterceptorHandler handler) {
    // Assume 401 stands for token expired
    if (error.response?.statusCode == 401) {
      var bearerToken = localStorage.getString(USER_TOKEN);

      var options = error.response!.requestOptions;
      // If the token has been updated, repeat directly.
      if (bearerToken != options.headers[TOKEN_HEADER]) {
        options.headers[TOKEN_HEADER] = bearerToken;
        //repeat
        dio.fetch(options).then(
          (r) => handler.resolve(r),
          onError: (e) {
            handler.reject(e);
          },
        );
        return;
      }
      // update token and repeat
      // Lock to block the incoming request until the token updated
      dio.lock();
      dio.interceptors.responseLock.lock();
      dio.interceptors.errorLock.lock();
      tokenDio.get(ApiEndpoints.token).then((d) {
        var updatedToken = d.data!['token'];
        //update token
        options.headers[TOKEN_HEADER] = updatedToken;
        localStorage.saveString(USER_TOKEN, updatedToken);
      }).whenComplete(() {
        dio.unlock();
        dio.interceptors.responseLock.unlock();
        dio.interceptors.errorLock.unlock();
      }).then((e) {
        //repeat
        dio.fetch(options).then(
          (r) => handler.resolve(r),
          onError: (e) {
            handler.reject(e);
          },
        );
      });
      return;
    }
    return handler.next(error);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    var token = localStorage.getString(USER_TOKEN);
    if (token == null) {
      print('no token，request token firstly...');
      dio.lock();
      //print(dio.interceptors.requestLock.locked);
      tokenDio.get('/token').then((d) {
        options.headers['csrfToken'] = token = d.data['data']['token'];
        print('request token succeed, value: ' + d.data['data']['token']);
        print(
            'continue to perform request：path:${options.path}，baseURL:${options.path}');
        handler.next(options);
      }).catchError((error, stackTrace) {
        handler.reject(error, true);
      }).whenComplete(() => dio.unlock()); // unlock the dio
    } else {
      options.headers['csrfToken'] = token;
      return handler.next(options);
    }
  }
}
