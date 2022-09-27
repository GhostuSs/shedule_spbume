import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rasp_spbume/models/data.dart';
import 'package:rasp_spbume/ui/ui/app.dart';
import 'package:hive/hive.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Directory directory = Directory.current;
  if (Platform.isIOS){
    directory = await getApplicationDocumentsDirectory();
  }else{
    directory = await getApplicationDocumentsDirectory();
  }
  Hive.init(directory.path);
  Hive..registerAdapter(SheduleAdapter())
      ..registerAdapter(DayAdapter())
      ..registerAdapter(SubjectAdapter());
  runApp(const EntryPoint());
}

