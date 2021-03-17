const amplifyconfig = ''' {
    "UserAgent": "aws-amplify-cli/2.0",
    "Version": "1.0",
    "auth": {
        "plugins": {
            "awsCognitoAuthPlugin": {
                "UserAgent": "aws-amplify-cli/0.1.0",
                "Version": "0.1.0",
                "IdentityManager": {
                    "Default": {}
                },
                "CredentialsProvider": {
                    "CognitoIdentity": {
                        "Default": {
                            "PoolId": "ap-southeast-1:e96173f4-b458-4f71-9c70-5762b2d64565",
                            "Region": "ap-southeast-1"
                        }
                    }
                },
                "CognitoUserPool": {
                    "Default": {
                        "PoolId": "ap-southeast-1_ZdMZ91dIe",
                        "AppClientId": "6rcbhf3v3n20497s0m6itm47co",
                        "AppClientSecret": "1jgnkbm5a52ui7nl9i3h9tlmpc099hu68m205cmkpjcba6g1gv9i",
                        "Region": "ap-southeast-1"
                    }
                },
                "Auth": {
                    "Default": {
                        "OAuth": {
                            "AppClientId": "6rcbhf3v3n20497s0m6itm47co",
                            "AppClientSecret": "1jgnkbm5a52ui7nl9i3h9tlmpc099hu68m205cmkpjcba6g1gv9i",
                            "SignInRedirectURI": "https://localhost/",
                            "SignOutRedirectURI": "https://localhost/",
                            "Scopes": [
                                "phone",
                                "email",
                                "openid",
                                "profile",
                                "aws.cognito.signin.user.admin"
                            ]
                        },
                        "authenticationFlowType": "USER_SRP_AUTH"
                    }
                }
            }
        }
    }
}''';