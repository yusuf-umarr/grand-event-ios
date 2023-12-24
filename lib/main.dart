import 'package:flutter/material.dart';
// import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:grandlyradio/router.dart';
import 'package:grandlyradio/src/core/utilities/theme_provider.dart';
import 'package:grandlyradio/src/features/auth/view_model/auth_view_model.dart';
import 'package:grandlyradio/src/features/home/view/home_nav_bar.dart';
import 'package:grandlyradio/src/features/music/view_model/music_view_model.dart';
import 'package:provider/provider.dart';
import 'package:upgrader/upgrader.dart';
import 'src/features/home/view_model/home_view_model.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();

  // WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  //  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => HomeViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthViewModel(),
    ),
    ChangeNotifierProvider(
      create: (context) => MusicViewModel(),
    ),
  ], child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Provider.of<HomeViewModel>(context, listen: false)
        .getProgremSchedule(context);
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return MaterialApp(
      themeMode: themeProvider.themeMode,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.darkTheme,
      title: 'Grandly Multimedia',
      debugShowCheckedModeBanner: false,
      onGenerateRoute: (settings) => generateRoute(settings),
      home: Scaffold(
          body: UpgradeAlert(
        child: HomeNavBar(),
      )),
    );
  }
}
