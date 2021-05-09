import 'dart:io';

String apiResposeMock(String name) =>
    File('lib/core/mock_api_responses/$name').readAsStringSync();
