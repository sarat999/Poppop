import 'package:flutter/material.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  // Filed
  String name, email, password;
  final fromKey = GlobalKey<FormState>();

  // Method
  Widget nameText() {
    Color color = Colors.red.shade900;
    return TextFormField(
      onSaved: (value) {
        name = value;
      },
      decoration: InputDecoration(
        icon: Icon(
          Icons.face,
          color: color,
          size: 48.0,
        ),
        labelText: 'Display Name :',
        labelStyle: TextStyle(color: color),
        helperText: 'Type Your Name',
        helperStyle: TextStyle(color: color),
        hintText: 'English Only',
      ),
    );
  }

  Widget emailText() {
    Color color = Colors.purple.shade900;
    return TextFormField(
      onSaved: (value) {
        email = value;
      },
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        icon: Icon(
          Icons.email,
          color: color,
          size: 48.0,
        ),
        labelText: 'Email :',
        labelStyle: TextStyle(color: color),
        helperText: 'Your Email',
        helperStyle: TextStyle(color: color),
        hintText: 'you@email.com',
      ),
    );
  }

  Widget passwordText() {
    Color color = Colors.green.shade900;
    return TextFormField(
      onSaved: (value) {
        password = value;
      },
      decoration: InputDecoration(
        icon: Icon(
          Icons.lock,
          color: color,
          size: 48.0,
        ),
        labelText: 'Password :',
        labelStyle: TextStyle(color: color),
        helperText: 'Type Your Password',
        helperStyle: TextStyle(color: color),
        hintText: 'More 6 Charactor',
      ),
    );
  }

  Widget registerButton() {
    return IconButton(
      icon: Icon(Icons.cloud_upload),
      onPressed: () {
        fromKey.currentState.save();
        print('name = $name, email = $email, password = $password');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: Text('Register'),
        actions: <Widget>[registerButton()],
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
          colors: [Colors.white, Colors.blue.shade700],
          radius: 1.5,
          center: Alignment.topCenter,
        )),
        child: Form(
          key: fromKey,
          child: ListView(
            padding: EdgeInsets.all(30.0),
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
            ],
          ),
        ),
      ),
    );
  }
}
