package com.example.new_aws_auth1;

import android.content.Context;
import android.os.Bundle;
import android.provider.Settings;
import android.util.Log;

import com.amazonaws.mobile.client.AWSMobileClient;
import com.amazonaws.mobile.client.Callback;
import com.amazonaws.mobile.client.UserStateDetails;
import com.amplifyframework.core.Amplify;


import org.jetbrains.annotations.NotNull;

import java.nio.channels.Channel;
import java.util.Objects;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;




public class MainActivity extends FlutterActivity {
    private static final String CHANNEL = "flutter.native/helper";
//    static final String userId = "";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);

//    GeneratedPluginRegistrant.registerWith(this);
        //GeneratedPluginRegistrant.registerWith(new FlutterEngine(this));
        new MethodChannel(Objects.requireNonNull(getFlutterEngine()).getDartExecutor().getBinaryMessenger(), CHANNEL).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(@NotNull MethodCall call, @NotNull MethodChannel.Result result) {
                        if (call.method.equals("helloFromNativeCode")) {
                            String s= call.argument("id");
                            String greetings = sendOpenIDToAWS(s);
                            result.success(greetings);
                            // Log.e("TAG", s);
                            // System.out.print(s



                        }
                    }});
    }
    private String helloFromNativeCode(String id) {
        //  return "Hello from Native Android Code";
        return id;
    }

    private String sendOpenIDToAWS(String idToken)
    {
//        final String[] userID = new String[1];
        // Add this line, to include the Auth plugin.
        AWSMobileClient mobileClient =
                (AWSMobileClient) Amplify.Auth.getPlugin("awsCognitoAuthPlugin").getEscapeHatch();
        // Log.d("myTag", "This is my message");
        assert mobileClient != null;

        final String[] user = {""};
        mobileClient.federatedSignIn("securetoken.google.com/new-aws-auth1",  idToken,
                new  Callback<UserStateDetails>() {
                    @Override
                    public void onResult(UserStateDetails userStateDetails) {
                        // return 'succesfull';
                        user[0] = userStateDetails.toString();
                         Log.d("myTag", ""+user[0]);


                        //("AmplifyQuickstar", "sign in success");

//                        String userID = mobileClient.getIdentityId();
//                         Log.i("myTag", userID);
                        // gotoProfileActivity(phoneNumber)
                    }

                    @Override
                    public void onError(Exception e) {
                        //  return e;
                        // Log.d("myTag", "This is my message2");



                    }
                }
        );
       String userId= mobileClient.getIdentityId();
        Log.i("myTag", userId);
       return userId;
    }


}
