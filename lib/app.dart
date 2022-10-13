import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'core/routing/route_helper.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      key: UniqueKey(),
      builder: DevicePreview.appBuilder,
      navigatorKey: Get.key,
      title: 'Flutter Task',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: const Color(0xFFFDFFFF),
        primaryColor: const Color(0xFFEE6A61),
        fontFamily: "Poppins",
        primarySwatch: Colors.blue,
      ),
      initialRoute: RouteHelper.getInitialRoute(),
      getPages: RouteHelper.routes,
    );
  }
}
