import 'package:flutter/material.dart';
import 'package:farket/screens/market_detay.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UrunListe extends  StatelessWidget {
@override
Widget build(BuildContext context) {
  // <1> Use StreamBuilder
  return StreamBuilder<QuerySnapshot>(
    // <2> Pass `Stream<QuerySnapshot>` to stream
      stream: FirebaseFirestore.instance.collection('urunler').snapshots(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          // <3> Retrieve `List<DocumentSnapshot>` from snapshot
          final List<DocumentSnapshot> documents = snapshot.data.docs;
           return ListView(
              children: documents
                  .map((doc) => urunKarti(doc['adi'].toString(),doc['aciklama'].toString(),'assets/urun/'+doc['resimyolu'].toString()
                            )).toList());
        } else if (snapshot.hasError) {
          return Text('It\'s Error!');
        }
      });
}
}

  Widget urunKarti(String isim, String aciklama, String resimYolu) {
    return GestureDetector(
      /*
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MarketDetay(
                      isim: isim,
                      aciklama: aciklama,
                      resimYolu: resimYolu,
                    )));
      },*/
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                blurRadius: 4.0,
                spreadRadius: 2.0,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Hero(
              tag: resimYolu,
              child: Container(
                width: 120.0,
                height: 120.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(resimYolu),
                      fit: BoxFit.fitWidth,
                    ),
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            SizedBox(
              height: 8.0,
            ),
            Text(isim,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey[600],
                )),
            SizedBox(
              height: 8.0,
            ),
            Text(aciklama,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red[400],
                )),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

/*
    return Scaffold(
      appBar: AppBar(
        title: Text('Farket-Urunler'),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
        padding: EdgeInsets.all(10.0),
        childAspectRatio: 1,
        children: urunlerListe,
      ),
    );
*/

  }

