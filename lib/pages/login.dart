import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

final FirebaseAuth _auth = FirebaseAuth.instance;

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _success;
  String _userEmail;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xfff4a259),
              Color(0xffbc4b51),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          // appBar: AppBar(
          //   title: Text('Clips Login'),
          //   actions: <Widget>[
          //     Builder(builder: (BuildContext context) {
          //       return FlatButton(
          //         child: const Text('Sign out'),
          //         textColor: Theme.of(context).buttonColor,
          //         onPressed: () async {
          //           final User user = _auth.currentUser;
          //           if (user == null) {
          //             Scaffold.of(context).showSnackBar(const SnackBar(
          //               content: Text('No one has signed in.'),
          //             ));
          //             return;
          //           }
          //           _signOut();
          //           final String uid = user.uid;
          //           Scaffold.of(context).showSnackBar(SnackBar(
          //             content: Text(uid + ' has successfully signed out.'),
          //           ));
          //         },
          //       );
          //     })
          //   ],
          // ),
          body: Builder(builder: (BuildContext context) {
            return Form(
              key: _formKey,
              child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(top: 110, bottom: 60),
                          child: Text(
                            'Clips',
                            style: TextStyle(fontSize: 40, color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10.0),
                          child: TextFormField(
                            controller: _emailController,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(height: 0),
                              labelText: "Email",
                              errorText: '',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) return '';
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _passwordController,
                            decoration: InputDecoration(
                              errorStyle: TextStyle(height: 0),
                              labelText: "Password",
                              errorText: '',
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(),
                              ),
                            ),
                            validator: (String value) {
                              if (value.isEmpty) return '';
                              return null;
                            },
                            obscureText: true,
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 45.0,
                          width: 240.0,
                          child: Material(
                            shape: StadiumBorder(),
                            textStyle: Theme.of(context).textTheme.button,
                            elevation: 2.0,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Expanded(
                                  child: RaisedButton(
                                    elevation: 0.0,
                                    color: Color(0xff5b8e7d),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.horizontal(
                                            left: Radius.circular(50))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(0.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Login",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        _signInWithEmailAndPassword();
                                      }
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RaisedButton(
                                    elevation: 0.0,
                                    color: Color(0xffbc4b51),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.horizontal(
                                            right: Radius.circular(50))),
                                    child: Padding(
                                      padding: const EdgeInsets.all(2.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          Text(
                                            "Register",
                                            style:
                                                TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),
                                    ),
                                    onPressed: () async {
                                      if (_formKey.currentState.validate()) {
                                        _register();
                                      }
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                            alignment: Alignment.center,
                            child: Text(_success == null
                                ? ''
                                : (_success
                                    ? 'Successfully registered ' + _userEmail
                                    : 'Registration failed'))),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'OR',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: SignInButton(
                            Buttons.Google,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            onPressed: () => _signInWithGoogle(),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 3),
                        ),
                        Container(
                          child: SignInButton(
                            Buttons.GitHub,
                            onPressed: () => _signInWithGithub(),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 3),
                        ),
                      ],
                    ),
                  )),
            );
          }),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _signInWithEmailAndPassword() async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: _emailController.text,
        password: _passwordController.text,
      ))
          .user;

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("${user.email} signed in"),
      ));
    } catch (e) {
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Email & Password"),
      ));
    }
  }

  void _signInWithGithub() async {
    try {
      UserCredential userCredential;
      if (kIsWeb) {
        GithubAuthProvider githubProvider = GithubAuthProvider();
        userCredential = await _auth.signInWithPopup(githubProvider);
      } else {
        // TODO: replace with actual github access token
        final AuthCredential credential =
            GithubAuthProvider.credential('GithubAcessToken');
        userCredential = await _auth.signInWithCredential(credential);
      }

      final user = userCredential.user;

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Sign In ${user.uid} with GitHub"),
      ));
    } catch (e) {
      print(e);
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with GitHub: $e"),
      ));
    }
  }

  void _signInWithGoogle() async {
    try {
      UserCredential userCredential;

      if (kIsWeb) {
        GoogleAuthProvider googleProvider = GoogleAuthProvider();
        userCredential = await _auth.signInWithPopup(googleProvider);
      } else {
        final GoogleSignInAccount googleUser = await GoogleSignIn().signIn();
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;
        final GoogleAuthCredential googleAuthCredential =
            GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        userCredential = await _auth.signInWithCredential(googleAuthCredential);
      }

      final user = userCredential.user;
      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Sign In ${user.uid} with Google"),
      ));
    } catch (e) {
      print(e);

      Scaffold.of(context).showSnackBar(SnackBar(
        content: Text("Failed to sign in with Google: $e"),
      ));
    }
  }

  void _register() async {
    final User user = (await _auth.createUserWithEmailAndPassword(
      email: _emailController.text,
      password: _passwordController.text,
    ))
        .user;
    if (user != null) {
      setState(() {
        _success = true;
        _userEmail = user.email;
      });
    } else {
      _success = false;
    }
  }

  void _signOut() async {
    await _auth.signOut();
  }
}
