import 'dart:async';
import 'package:flutter/material.dart';
import 'package:naraakom/core/app_export.dart';
import 'package:naraakom/core/helper/functions/common.dart';
import 'package:naraakom/core/utils/app_consts.dart';
import 'package:naraakom/core/utils/extension/widget.dart';
import 'package:naraakom/features/login/presentation/pages/login_screen.dart';



class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late Timer timer;

  @override
  void initState() {
    setLightStatusBar();
    timer = Timer.periodic(const Duration(seconds: 5), (timer) {
      Login().launch(context,isNewTask: true);
      timer.cancel();
    });
    super.initState();
  }

  @override
  void dispose() {
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
     AppConsts.appHeight=MediaQuery.of(context).size.height;
     AppConsts.appWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
          child: TweenAnimationBuilder(
        tween: Tween<double>(begin: 0, end: 1),
        duration: const Duration(milliseconds: 500),
        builder: (context, double value, child) =>
            Transform.scale(
                scale: value,
                child: Opacity(
                    opacity: value,
                    child: Image.asset(AppAssets.splach))),
      )),
    );
  }
}
