import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/stars_controller.dart';

class StarsView extends GetView<StarsController> {
  const StarsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetX(
          init: StarsController(),
          builder: (controller) {
            return Scaffold(
              appBar: AppBar(
                title: const Text('StarsView'),
                centerTitle: true,
              ),
              body: Center(
                child: Text(
                  controller.userId.value,
                  style: TextStyle(fontSize: 20),
                ),
              ),
            );
          }),
    );
  }
}
