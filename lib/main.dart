import 'package:flutter/material.dart';
import 'package:flutter_config/flutter_config.dart';
import 'package:plan_it_on/config/config.dart';
import 'pages/HomePage.dart';
import 'pages/loginui.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wiredash/wiredash.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool login=prefs.getBool('login');
  await FlutterConfig.loadEnvVariables();
  runApp(login==null?MyApp1():login?MyApp():MyApp1());
}

class MyApp extends StatelessWidget {
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Wiredash(
      navigatorKey: _navigatorKey,
      projectId: 'passable-main-1vb98gq',
      secret: '598y615l2g3xtt21wi75ekwltzyri206',
      child: MaterialApp(
        navigatorKey: _navigatorKey,
        title: 'Passable',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          accentColor: AppColors.secondary,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage(),
        routes: {
          'login':(context)=>AskLogin(),
          'homepage':(context)=>HomePage()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyApp1 extends StatelessWidget {
  final _navigatorKey1 = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return Wiredash(
      navigatorKey: _navigatorKey1,
      projectId: 'passable-main-1vb98gq',
      secret: '598y615l2g3xtt21wi75ekwltzyri206',
      child: MaterialApp(
        navigatorKey: _navigatorKey1,
        title: 'Pass-it-on',
        theme: ThemeData(
          primaryColor: AppColors.primary,
          accentColor: AppColors.secondary,
          brightness: Brightness.light,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: AskLogin(),
        routes: {
          'login':(context)=>AskLogin(),
          'homepage':(context)=>HomePage()
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

