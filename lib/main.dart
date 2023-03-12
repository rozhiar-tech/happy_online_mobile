import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

// import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Happy",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
