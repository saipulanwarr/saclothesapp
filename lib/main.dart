import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:saclothesapp/users/authentication/login_screen.dart';
import 'package:saclothesapp/users/fragments/dashboard_of_fragments.dart';
import 'package:saclothesapp/users/userPreferences/user_preferences.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Clothes App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: FutureBuilder(
          future: RememberUserPrefs.readUserInfo(),
          builder: (context, snapshot) {
            if (snapshot.data == null) {
              return LoginScreen();
            } else {
              return DashboardOfFragments();
            }
          },
        ));
  }
}
