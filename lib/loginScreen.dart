import 'package:flutter/material.dart';
import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'homeScreen.dart';

class loginScreen extends StatelessWidget {
  final _phoneController = TextEditingController();
  final _codeController = TextEditingController();

  Future<bool> loginUser(String phone, BuildContext context) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    final FirebaseUser user1 = await _auth.currentUser();

    _auth.verifyPhoneNumber(
        phoneNumber: phone,
        timeout: Duration(seconds: 90),
        verificationCompleted: (AuthCredential credential) async {
          Navigator.of(context).pop();

          AuthResult result = await _auth.signInWithCredential(credential);
          FirebaseUser user = result.user;

          if (user != null) {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => homeScreen(
                          user: user,
                        )));
          } else {
            print("Error");
          }
        },
        verificationFailed: (AuthException exception) {
          print("tttt" + exception.message);
        },
        codeSent: (String verificationId, [int forceResendingToken]) {
          showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) {
                return AlertDialog(
                  title: Text("Give the code"),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextField(
                        controller: _codeController,
                      )
                    ],
                  ),
                  actions: [
                    FlatButton(
                      child: Text("Conferm"),
                      textColor: Colors.white,
                      color: Colors.blue,
                      onPressed: () async {
                        final code = _codeController.text.trim();
                        AuthCredential credential =
                            PhoneAuthProvider.getCredential(
                                verificationId: verificationId, smsCode: code);
                        AuthResult result =
                            await _auth.signInWithCredential(credential);
                        FirebaseUser user = result.user;

                        print(user1.getIdToken());

                        if (user != null) {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => homeScreen(
                                        user: user,
                                      )));
                        } else {
                          print("Error");
                        }
                      },
                    )
                  ],
                );
              });
        },
        codeAutoRetrievalTimeout: null);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(32),
          child: Form(
            child: Column(
              children: [
                Text("Login",
                    style: TextStyle(
                        color: Colors.lightBlue,
                        fontSize: 36,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.grey[300])),
                      filled: true,
                      fillColor: Colors.grey[100],
                      hintText: "Mobile Number"),
                  controller: _phoneController,
                ),
                SizedBox(height: 16),
                FlatButton(
                  child: Text("LOGIN"),
                  textColor: Colors.red,
                  padding: EdgeInsets.all(16),
                  onPressed: () {
                    final phone = _phoneController.text.trim();
                    loginUser(phone, context);
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}