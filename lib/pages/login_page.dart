import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mivault/api/google_sign_in_api.dart';

import '../services/authentication.dart';

class LoginPage extends StatefulWidget {
  const LoginPage(
      {Key? key,
      required this.setLoadingState,
      required this.setAuthenticatedState,
      required this.setUnauthenticatedState})
      : super(key: key);

  final VoidCallback setLoadingState;
  final VoidCallback setAuthenticatedState;
  final VoidCallback setUnauthenticatedState;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  Future signIn() async {
    // await GoogleSignInApi.login();
    final GoogleSignIn googleSignIn = GoogleSignIn(
      scopes: <String>[
        'email',
      ],
    );

    // Get the user after successful sign in
    var googleUser = await googleSignIn.signIn();
    print(googleUser);
  }

  Future<void> loginAction() async {
    widget.setLoadingState();
    final authSuccess = await AuthService.instance.login();
    if (authSuccess) {
      widget.setAuthenticatedState();
    } else {
      widget.setUnauthenticatedState();
    }
  }

  Future<void> logoutAction() async {
    widget.setLoadingState();
    final authSuccess = await AuthService.instance.logout();
    if (authSuccess) {
      widget.setAuthenticatedState();
    } else {
      widget.setUnauthenticatedState();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.greenAccent,
        child: Center(
          child: SizedBox(
            width: double.infinity,
            child: Container(
              padding: const EdgeInsets.all(30),
              child: FloatingActionButton.extended(
                onPressed: loginAction,
                // onPressed: logoutAction,
                label: const Text("Sign In with Google"),
                icon: const Icon(Icons.login),
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                ),
            ),
            ),
          // child: Card(
          //   color: Colors.white,
          //   elevation: 3,
          //   child: SizedBox(
          //     width: 350,
          //     height: 200,
          //     child: Container(
          //       padding: const EdgeInsets.all(30),
          //       child: Column(
          //         crossAxisAlignment: CrossAxisAlignment.start,
          //         mainAxisAlignment: MainAxisAlignment.start,
          //         children: [
          //           const Text("Sign In",
          //               style: TextStyle(
          //                   color: Colors.black54,
          //                   fontWeight: FontWeight.bold,
          //                   fontSize: 30)),
          //           const SizedBox(height: 40),
          //           SizedBox(
          //             width: double.infinity,
          //             child: ElevatedButton.icon(
          //               onPressed: loginAction,
          //               label: const Text("Sign In with Google"),
          //               icon: const Icon(Icons.login),
          //               style: ElevatedButton.styleFrom(
          //                 backgroundColor: Colors.blueAccent,
          //                 foregroundColor: Colors.white,
          //                 shape: RoundedRectangleBorder(
          //                   borderRadius: BorderRadius.circular(5.0),
          //                 ),
          //               ),
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
        ),
      ),
    );
  }
}
