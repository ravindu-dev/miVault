import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:mivault/pages/add_page.dart';
import 'package:mivault/pages/home_page.dart';
import 'package:mivault/pages/login_page.dart';
import 'package:mivault/pages/more_page.dart';
import 'package:mivault/services/authentication.dart';

import 'components/loading_screen.dart';
import 'components/template.dart';

Future main() async {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isProgressing = false;
  bool isLoggedIn = false;
  @override
  void initState() {
    initAuth();
    super.initState();
  }

  initAuth() async {
    setLoadingState();
    final bool isAuthenticated = await AuthService.instance.initAuth();
    if (isAuthenticated) {
      setAuthenticatedState();
    } else {
      setUnauthenticatedState();
    }
  }

  setLoadingState() {
    setState(() {
      isProgressing = true;
    });
  }

  setAuthenticatedState() {
    setState(() {
      isProgressing = false;
      isLoggedIn = true;
    });
  }

  setUnauthenticatedState() {
    setState(() {
      isProgressing = false;
      isLoggedIn = false;
    });
  }
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MiVault',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        // '/loginPage': (context) => const LoginPage(
        //     setLoadingState: setLoadingState,
        //     setAuthenticatedState: setAuthenticatedState,
        //     setUnauthenticatedState: setUnauthenticatedState),
        '/morePage': (context) => const MorePage(),
        '/addPage': (context) => const AddPage(),
        '/homePage': (context) => const HomePage(),
      },
      // home: AppTemplate(),
      //  home: const LoginPage(),
      home: SafeArea(
        child: Builder(
          builder: (context) {
            if (isProgressing) {
              return const LoadingScreen();
            } else if (isLoggedIn) {
              return AppTemplate(
                setUnauthenticatedState: setUnauthenticatedState,
              );
            } else {
              return LoginPage(
                setLoadingState: setLoadingState,
                setAuthenticatedState: setAuthenticatedState,
                setUnauthenticatedState: setUnauthenticatedState,
              );
            }
          },
        ),
      ),
    );
  }
}
