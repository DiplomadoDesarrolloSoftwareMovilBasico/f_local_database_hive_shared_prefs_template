import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loggy/loggy.dart';
import 'data/models/userdb.dart';
import 'domain/repositories/user_repository.dart';
import 'domain/use_case/authentication.dart';
import 'ui/controllers/authentication_controller.dart';
import 'ui/my_app.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<List<Box>> _openBox() async {
  List<Box> boxList = [];
  await Hive.initFlutter();
  Hive.registerAdapter(UserDBAdapter());
  boxList.add(await Hive.openBox("users"));
  return boxList;
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _openBox();
  Loggy.initLoggy(
    logPrinter: const PrettyPrinter(
      showColors: true,
    ),
  );
  Get.put(UserRepository());
  Get.lazyPut<Authentication>(() => Authentication());
  Get.put(AuthenticationController());
  runApp(const MyApp());
}
