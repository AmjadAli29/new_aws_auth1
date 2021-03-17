package com.example.new_aws_auth1;

import android.app.Application;
import android.util.Log;

import com.amplifyframework.AmplifyException;
import com.amplifyframework.auth.cognito.AWSCognitoAuthPlugin;
import com.amplifyframework.core.Amplify;

public class MyApp  extends Application {
    @Override
    public void onCreate() {
        super.onCreate();
        // Add this line, to include the Auth plugin.
        try {
            Amplify.addPlugin(new AWSCognitoAuthPlugin());
            Amplify.configure(getApplicationContext());
            Log.i("AmplifyQuickstart", "Initialized");
        } catch (AmplifyException e) {
            e.printStackTrace();
            Log.i("AmplifyQuickstart", "Initialized Failed"+e.toString());

        }
    }
}
