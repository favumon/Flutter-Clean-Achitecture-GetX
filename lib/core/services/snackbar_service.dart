import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:injectable/injectable.dart';

abstract class SnackbarService {
  showAlertSnackbar({required String title, required String message});
}

@LazySingleton(as: SnackbarService)
class SnackbarSeviceImpl extends SnackbarService {
  final GetInterface get;
  SnackbarSeviceImpl(this.get);

  @override
  showAlertSnackbar({required title, required message}) {
    get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red);
  }
}
