

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
// import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
// import 'package:amplify_flutter/amplify.dart';
// import 'package:amplify_analytics_pinpoint/amplify_analytics_pinpoint.dart';

class homeScreen extends StatefulWidget {
  final FirebaseUser user;
  homeScreen({this.user});

  @override
  _homeScreenState createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  static const platform = const MethodChannel('flutter.native/helper'); 
  var id;
  

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    widget.user.getIdToken().then((token) {
      setState(() {
        id = token.token;
        // print(token);
        }
        );
    });
  }

      // getid() {
      //   widget.user.getIdToken().then((token) {
      //     //assert(token != null);
      //     setState(() {
      //       id = token.token;
      //     });
      //     print('token id is' + id);
      //   });
      // }

      void printy() async {

        String value='';
        
        try {
          
          //  value = await platform.invokeMethod("helloFromNativeCode");
          value = await platform.invokeMethod("helloFromNativeCode",{"id":id});
          
        } catch (e) {
          print(e);
        }
        print("token id from javanative:"+value);
      }

      // sendOpenId(String idtoken) {
      //   // Amplify.addPlugin(AmplifyAuthCognito(Amplify.Auth.signInWithWebUI(provider: _tokenid)));
      //   // var client = Amplify.Auth.addPlugin("awscloudformation").
      //   // var mobileClient = Amplify.Auth.signInWithWebUI(provider: _tokenid);

      //   var client = Amplify.Auth.signInWithWebUI(provider: _tokenid);
      // }

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          body: Container(
            padding: EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "You are logged in succesfully",
                  style: TextStyle(color: Colors.lightBlue, fontSize: 32),
                ),
                SizedBox(
                  height: 16,
                ),
                Text(
                "some..."
                ),
                SizedBox(
                  height: 16,
                ),
                RaisedButton(onPressed: () {
                  //getid;
                  printy();
                }, child: Text("ok"))
              ],
            ),
          ),
        );
      }

}