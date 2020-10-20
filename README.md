# firelogin

🔥 An example Flutter app for firebase login and authentication

When attempting to set up a firebase login in flutter I found a plethora of decent examples, but many were ugly, outdated, or overcomplicated, so I put together a one-page solution that looks somewhat decent based on the [FlutterFire Auth Example](https://github.com/FirebaseExtended/flutterfire/tree/master/packages/firebase_auth/firebase_auth/example)

<img src="https://user-images.githubusercontent.com/47064842/96534823-81de7e00-125e-11eb-8130-e2965f657679.jpg" width="30%"></img> 

## Setup

Create a [Firebase](https://firebase.google.com/) account if you do not have one. Registering your application and download the `google-services.json` file to your project in the `android/app` directory

Make sure the following packages are in your [pubspec.yaml](pubspec.yaml):

- [google_sign_in](https://pub.dev/packages/google_sign_in)
- [firebase_auth](https://pub.dev/packages/firebase_auth)

## Firebase Settings

Enable at least one 'sign-in method' under the authentication tab. firelogin uses email/password, Google, and Github authentication.

To use Google authentication, you need to register a support email and debug SHA certificate fingerprint.

Use the following command in a terminal to generate a debug certificate fingerprint. More details can be found [here](https://developers.google.com/android/guides/client-auth)

```
keytool -list -v -alias androiddebugkey -keystore %USERPROFILE%\.android\debug.keystore
```

Default password is `android`
