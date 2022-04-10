import 'package:abctechapp/pages/home_bind.dart';
import 'package:abctechapp/pages/home_page.dart';
import 'package:abctechapp/provider/assistance_provider.dart';
import 'package:abctechapp/services/assistance_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initServices();
  runApp(const MyApp());
}

void initServices() async {
  await Get.putAsync(() => AssistanceService().init(AssistanceProvider()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(
          name: "/",
          page: () => const HomePage(),
          binding: HomeBind(),
        ),
      ],
    );
  }
}
