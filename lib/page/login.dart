import 'package:flutter/material.dart';
import 'package:uas_flutter/main.dart';
import 'package:uas_flutter/page/home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  validateLogin() {
    if (username.text != MyApp.username || password.text != MyApp.password) {
      _showDialog("Username atau Password salah", 'Maaf', context);
    } else {
      _showDialog("Selamat Datang " + username.text, 'Halo !', context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Home()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SingleChildScrollView(
          child: Column(
        children: [
          Image.asset("assets/images/logo.png", scale: 15),
          Container(
            padding: EdgeInsets.all(10),
            child: Form(
              key: _formkey,
              child: Column(
                children: [
                  Text("Login", style: TextStyle(fontSize: 25)),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: TextFormField(
                      controller: username,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey)),
                          labelText: 'Username'),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    child: TextFormField(
                      controller: password,
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(width: 1, color: Colors.grey)),
                          labelText: 'Password'),
                      obscureText: true,
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: <Widget>[
                      ButtonTheme(
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            validateLogin();
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all<Color>(Colors.blue),
                              padding: MaterialStateProperty.all(
                                  EdgeInsets.all(15))),
                          child: Text(
                            'Login',
                            style: TextStyle(fontSize: 20, color: Colors.white),
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      )),
    ));
  }
}

Future<void> _showDialog(String message, String title, BuildContext context) {
  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(message),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Oke'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
