import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SnackbarService {
  final GetInterface get;
  SnackbarService(this.get);

  showAlertSnackbar({required title, required message}) {
    get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
  }
}
