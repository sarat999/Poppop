import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:poppop/screens/my_service.dart';
import 'package:poppop/screens/register.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Field

  // Method
  @override
  void initState(){
    super.initState();
    checkStatus();
  }

  Future<void> checkStatus()async{
    FirebaseAuth firebaseAuth = FirebaseAuth.instance;
    FirebaseUser firebaseUser = await firebaseAuth.currentUser();
    if (firebaseUser != null) {
      myRouteToService();
    }
  }

  void myRouteToService(){
    MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context){return MyService();});
    Navigator.of(context).pushAndRemoveUntil(materialPageRoute, (Route<dynamic> route){return false;});
  }



  Widget signInButton() {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      color: Colors.blue[400],
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      onPressed: () {},
    );
  }

  Widget signUpButton() {
    return OutlineButton(
      borderSide: BorderSide(color: Colors.blue),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Text(
        'Sign Up',
        style: TextStyle(color: Colors.blue[400]),
      ),
      onPressed: () {
        print('You Click SignUp');
        
        MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context){return Register();});
        Navigator.of(context).push(materialPageRoute);


      },
    );
  }

  Widget showButton() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        signInButton(),
        SizedBox(
          width: 5.0,
        ),
        signUpButton(),
      ],
    );
  }

  Widget userText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.perm_identity,
            size: 36.0,
            color: Colors.blue[400],
          ),
          labelText: 'User :',
        ),
      ),
    );
  }

  Widget passwordText() {
    return Container(
      width: 250.0,
      child: TextFormField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            size: 36.0,
            color: Colors.blue[400],
          ),
          labelText: 'Password :',
        ),
      ),
    );
  }

  Widget showLogo() {
    return Container(
      width: 120.0,
      height: 120.0,
      child: Image.asset('images/logo.png'),
    );
  }

  Widget showAppName() {
    return Text(
      'มาสเตอร์',
      style: TextStyle(
        color: Colors.blue[400],
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        fontStyle: FontStyle.italic,
        fontFamily: 'Mitr',
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/wall.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Color.fromARGB(180, 255, 255, 255),
              ),
              padding: EdgeInsets.all(18.0),
              // color: Color.fromARGB(180,255,255,255),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    showLogo(),
                    showAppName(),
                    userText(),
                    passwordText(),
                    SizedBox(
                      height: 8.0,
                    ),
                    showButton(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
