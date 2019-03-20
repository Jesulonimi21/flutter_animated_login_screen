import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: Scaffold(body: LoginPage()),
    );
  }
}

class LoginPage extends StatefulWidget {
  State createState() {
    return LoginPageState();
  }
}

class LoginPageState extends State with SingleTickerProviderStateMixin {
  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();
    _iconAnimationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 500));
    _iconAnimation = new CurvedAnimation(
        parent: _iconAnimationController, curve: Curves.bounceOut);
    _iconAnimation.addListener(() => this.setState(() => {}));
    _iconAnimationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(fit: StackFit.expand, children: <Widget>[
        Image(
          image: AssetImage("assets/girl.jpeg"),
          fit: BoxFit.cover,
          color: Colors.black87,
          colorBlendMode: BlendMode.darken,
        ),
        Column(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
          FlutterLogo(
            size: _iconAnimation.value * 100,
          ),
          Form(
              child: Theme(
            data: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.teal,
            inputDecorationTheme: InputDecorationTheme(
              labelStyle: TextStyle(
                color: Colors.teal,
                fontSize: 20.0
              )
            )),
            child: Container(
              padding: EdgeInsets.all(40.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[

                TextFormField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: "Enter email"),
                ),
                TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: "Enter Password"),
                  obscureText: true,
                ),
                      Padding(
                        padding: EdgeInsets.only(top:40.0),
                      ),
                    MaterialButton(
                      height: 40.0,
                      minWidth: 100.0,
                      textColor: Colors.white,
                      color: Colors.teal,
                      child: Text("Login"),
                      splashColor: Colors.red,
                      onPressed: (){},
                    )
              ]),
            ),
          ))
        ])
      ]),
    );
  }
}
