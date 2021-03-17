import 'package:amplify_flutter/amplify.dart';
import 'package:flutter/material.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';

import 'amplifyconfiguration.dart';
import 'loginScreen.dart';


void main(List<String> args) {
  runApp(MaterialApp(
    home: loginScreen(),
  ));
}