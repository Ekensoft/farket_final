import 'package:farket/screens/barcode.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:farket/screens/hakkinda.dart';
import 'package:farket/screens/login.dart';
import 'package:farket/screens/kayit.dart';
import 'package:farket/screens/marketler.dart';
import 'package:farket/screens/urun_giris.dart';
import 'package:farket/screens/urun_liste.dart';
import 'package:farket/screens/users.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';


void main() {
   WidgetsFlutterBinding.ensureInitialized();
   runApp(MyApp());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Farket Hesaplı Alışveriş',
      theme: ThemeData(primarySwatch: Colors.blue,),
      initialRoute: '/login',
      routes: {
        '/': (context) => AnaSayfa(),
        '/login': (context) => Login(),
        '/kayit': (context) => Kayit(),
        '/barcode':(context) => MyBarcode(),
        '/marketler': (context) => Marketler(),
        '/urungiris': (context) => UrunGirisSayfasi(),
        '/urunliste': (context) => UrunListe(),
        '/users': (context) => UserInformation(),
        '/hakkinda': (context) =>UserInformation(),

      },
    );
  }
}

class AnaSayfa extends StatefulWidget {
  @override
  _AnaSayfaState createState() => _AnaSayfaState();
//   AnaSayfa();
}

class _AnaSayfaState extends State<AnaSayfa> {
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  String email;
  String password;

  @override
  Widget build(BuildContext context) {

      final marketButon = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Marketler()),
            );
          },
          child: Text("Marketler",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );

      final urunButon = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => UrunGirisSayfasi(),
              ),
            );
          },
          child: Text("Ürün Giriş",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );

    final urunlerButon = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(20.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => UrunListe(),
            ),
          );
        },
        child: Text("Ürün Liste",
            textAlign: TextAlign.center,
            style: style.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );

      final hakkindaButon = Material(
        elevation: 5.0,
        borderRadius: BorderRadius.circular(20.0),
        color: Color(0xff01A0C7),
        child: MaterialButton(
          minWidth: MediaQuery.of(context).size.width,
          padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBarcode()),
            );
          },
          child: Text("Hakkinda",
              textAlign: TextAlign.center,
              style: style.copyWith(
                  color: Colors.white, fontWeight: FontWeight.bold)),
        ),
      );

      return Scaffold(
        appBar: AppBar(
          title: Text('Farket Hesaplı Alışveriş'),
          actions: <Widget>[
            IconButton(
                icon:Icon(Icons.exit_to_app),
                onPressed: (){
                  FirebaseAuth.instance.signOut().then((deger)
                  {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => Login()),
                    (Route<dynamic> route) => false);
                  });
                }),
          ],
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
                  SizedBox(
                    height: 100.0,
                    child: Image.asset(
                      "assets/logo.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  SizedBox(height: 15.0),
                  marketButon,
                  SizedBox(height: 15.0),
                  urunButon,
                  SizedBox(
                    height: 15.0,
                  ),
                  urunlerButon,
                  SizedBox(
                    height: 15.0,
                  ),
                  hakkindaButon,
                  SizedBox(
                    height: 15.0,
                  ),

                ],
              ),
            ),
          ),
        ),
      );
    }
}

