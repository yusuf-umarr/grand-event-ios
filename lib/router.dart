import 'package:flutter/material.dart';
import 'package:grandlyradio/src/features/auth/view/auth_screen.dart';
import 'package:grandlyradio/src/features/home/view/about_us.dart';
import 'package:grandlyradio/src/features/home/view/add_schedule_program.dart';
import 'package:grandlyradio/src/features/music/view/download_music.dart';
import 'package:grandlyradio/src/features/home/view/grandly_tv.dart';
import 'package:grandlyradio/src/features/music/view/upload_music.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case GrandlyTv.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => GrandlyTv(),
      );
    case UploadedMusic.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UploadedMusic(),
      );
    case AddProgrammesSchedule.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => AddProgrammesSchedule(),
      );
    case AuthScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AuthScreen(),
      );
    case AboutUsScreen.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const AboutUsScreen(),
      );
    case UploadMusic.routeName:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const UploadMusic(),
      );

    default:
      return MaterialPageRoute(
        settings: routeSettings,
        builder: (_) => const Scaffold(
          body: Center(
            child: Text('Screen does not exist!'),
          ),
        ),
      );
  }
}
