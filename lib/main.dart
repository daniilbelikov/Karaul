import 'karaul_app.dart';
import 'package:flutter/material.dart';
import 'package:karaul/helpers/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final directory = await getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);
  await Hive.openBox(ConstKeys.contact);
  await Hive.openBox(ConstKeys.user);

  runApp(
    const KaraulApp(),
  );
}
