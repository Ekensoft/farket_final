import 'package:flutter/material.dart';
import 'package:farket/main.dart';
import 'package:farket/utils/uyari.dart';
import 'package:farket/screens/kayit.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login>  {
  User user;
  final myEmailController = TextEditingController();
  final myPasswordController = TextEditingController();
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  void initState()  {
   if (user!=null){ _auth.userChanges().listen((event) => setState(() => user = event));}
    super.initState();
  }

@override
  void dispose() {
    myEmailController.dispose();
    myPasswordController.dispose();
    super.dispose();
  }

  Future<void> girisYap () async {
    await Firebase.initializeApp();
   try {
     UserCredential userCredential =await FirebaseAuth.instance.signInWithEmailAndPassword(
         email: myEmailController.text,
         password: myPasswordController.text
     );
   } on FirebaseAuthException catch (e) {
     if (e.code == 'user-not-found') {
       print('No user found for that email.');
       EmailkayitYok();
     } else if (e.code == 'wrong-password') {
       print('Wrong password provided for that user.');
       yanlisSifre();
     }

   }
   finally{
     Navigator.pushAndRemoveUntil(
         context,
         MaterialPageRoute(builder: (_) => AnaSayfa()),
             (Route<dynamic> route) => false);
   }
  }

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
      controller: myEmailController,
      obscureText: false,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Email",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );
    final passwordField = TextField(
      controller: myPasswordController,
      obscureText: true,
      style: style,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          hintText: "Password",
          border:
              OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))),
    );

    final loginButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        // onPressed: () {},
        onPressed: () {

          var email = myEmailController.text;
          var password = myPasswordController.text;
          bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(email);
          bool passwordValid = RegExp(r'^.*(?=.{7,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[^a-zA-Z0-9]).*$').hasMatch(password);

          if (!emailValid)
          {
              hataliEposta();
           }else if (!passwordValid)
          {
              hataliSifre();
          } else {
              girisYap();
               }
        },
        child: Text("Giriş",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final kayitButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(30.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        // onPressed: () {},
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Kayit(),
            ),
          );
        },
        child: Text("Kayıt Ol",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

    final baslik = Material(
      borderRadius: BorderRadius.circular(10.0),
      color: Color(0xff01A0C7),
      child: Text("  Farket Hesaplı Alışveriş  ",
          textAlign: TextAlign.center,
          style:
              style.copyWith(color: Colors.white, fontWeight: FontWeight.bold)),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Farket-Giriş'),
      ),
      body: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                baslik,
                SizedBox(
                  height: 100.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 10.0),
                emailField,
                SizedBox(height: 10.0),
                passwordField,
                SizedBox(
                  height: 10.0,
                ),
               loginButon,
                SizedBox(
                  height: 10.0,
                ),
                kayitButon,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
