import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wastinnova/constants.dart';
import 'package:wastinnova/providers/user_provider.dart';
import 'package:wastinnova/screens/auth/login_screen.dart';
import 'package:wastinnova/screens/auth/registeration_screen.dart';
import 'package:wastinnova/screens/connect.dart';
import 'package:wastinnova/screens/dumpwaste.dart';
import 'package:wastinnova/screens/home.dart';
import 'package:wastinnova/screens/statistics.dart';
import 'package:wastinnova/screens/track.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => UserProvider()),
        ],
        child: MaterialApp(
          title: 'Wastinnova',
          theme: ThemeData(
            // primarySwatch: Color(0xFF37B943),
            primaryColor: Color(0xFF37B943),
            appBarTheme: AppBarTheme(color: Color(0xFF37B943)),
          ),
          initialRoute: 'signup',
          home: StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.active) {
                if (snapshot.hasData) {
                  return const Home();
                } else if (snapshot.hasError) {
                  return Center(
                    child: Text("${snapshot.error}"),
                  );
                }
              }
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CircularProgressIndicator(color: primaryColor),
                );
              }

              return const LoginScreen();
            },
          ),
          routes: {
            'home': (context) => Home(),
            'signup': (context) => SignUpScreen(),
            'login': (context) => LoginScreen(),
            'tracking': (context) => TrackingVan(),
            'stats': (context) => StatsScreen(),
            'dumpwaste': (connect) => DumpWaste(),
            'connect': (context) => ConnectScreen(),
          },
        ));
  }
}
