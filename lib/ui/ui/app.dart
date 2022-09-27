import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rasp_spbume/gen/assets.gen.dart';
import 'package:rasp_spbume/models/data.dart';
import 'package:rasp_spbume/ui/uikit/shedule_card.dart';
import 'package:rasp_spbume/utils/color_palette/colors.dart';
import 'package:rasp_spbume/utils/theme/apptheme.dart';
import 'dart:math' as math;

class EntryPoint extends StatefulWidget {
  const EntryPoint({Key? key}) : super(key: key);
  @override
  State<EntryPoint> createState() => _AppState();
}

class _AppState extends State<EntryPoint> with TickerProviderStateMixin {
  States state = States.loading;
  late AnimationController _controller;

  @override
  void initState() {
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 10))
          ..repeat();
    loadData();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        builder: (_, c) => MaterialApp(
              theme: AppTheme.mainTheme,
              home: Scaffold(
                body: Container(
                    decoration: BoxDecoration(
                        gradient: state==States.loading ? LinearGradient(colors: [AppColors.black,AppColors.black]) : const LinearGradient(
                          colors: [
                            AppColors.black,
                            AppColors.blue,
                            AppColors.red,
                          ],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight
                        )
                    ),
                    child:SafeArea(
                      minimum:
                      EdgeInsets.symmetric(horizontal:20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          state == States.loading
                              ? Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AnimatedBuilder(
                                animation: _controller,
                                builder: (_, child) {
                                  return Transform.rotate(
                                    angle: _controller.value * 2 * math.pi,
                                    child: child,
                                  );
                                },
                                child:
                                Assets.images.loadingmaga.svg(width: 320.w),
                              )
                            ],
                          )
                              : Column(
                            children: [
                              for(int i=0;i<Hive.box<Shedule>('shedule').values.first.days!.length;i++)DayCard(day: Hive.box<Shedule>('shedule').values.first.days![i])
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            ));
  }

  Future<void> loadData() async {
    state = States.loading;
    bool internetAvability = await internet();
    if(internetAvability) {
      await http.get(
        Uri.parse("https://6332dfab573c03ab0b52bdfc.mockapi.io/getData"),
      ).then((response) async {
        final responsedata = jsonDecode(utf8.decode(response.bodyBytes));
        var classifiedData = Shedule.fromJson(responsedata.first);
        final box = await Hive.openBox<Shedule>('shedule');
        await box.clear();
        await box.put('shedule', classifiedData);
      });
      _controller.stop();
    }
    setState(() {
      state = States.ready;
    });
  }
}

enum States { loading, ready }

///Проверка интернет-соединения
Future<bool> internet() async {
  try {
    final result = await InternetAddress.lookup('google.com');
    if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
      if (kDebugMode) {
        print('internet ok');
      }
      return true;
    } else {
      if (kDebugMode) {
        print('no internet');
      }
      return false;
    }
  } on SocketException catch (_) {
    if (kDebugMode) {
      print('error internet');
    }
    return false;
  }
}
