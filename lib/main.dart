import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import '../providers/user_provider.dart';
import '../screens/profile_screen.dart';
import 'package:provider/provider.dart';
import 'screens/home.dart';
import 'services/shared_services.dart';

Widget _defaultHome = const HomeScreen();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  bool _userLoggedIn = await SharedService.isLoggedIn();
  if (_userLoggedIn) {
    _defaultHome = ProfileScreen(
      showNumberOfQuestionModal: true,
      modalOpen: false,
    );
  }




  PermissionStatus permissionStatus;
   
      permissionStatus= await Permission.storage.request(); 
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(create: (context) => UserProviders())],
      child: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        routes: {'/': ((context) => _defaultHome)});
  }
}
