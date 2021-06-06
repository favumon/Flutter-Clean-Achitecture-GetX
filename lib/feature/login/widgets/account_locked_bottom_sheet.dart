import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccountLockedBottomSheet extends StatelessWidget {
  const AccountLockedBottomSheet();
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.red,
      child: Column(
        children: [
          Text('Account locked'.tr),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('test@test.com'),
              const Text('8546546546'),
            ],
          )
        ],
      ),
    );
  }
}
