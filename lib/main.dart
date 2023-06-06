import 'package:cashier_pallubasa_andalanga/theme/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme(),
      title: "Kasir Pallubasa Andalanga",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
