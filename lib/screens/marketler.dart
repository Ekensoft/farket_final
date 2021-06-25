import 'package:flutter/material.dart';
import 'package:farket/screens/market_detay.dart';

class Marketler extends StatefulWidget {
  @override
  _MarketlerState createState() => _MarketlerState();
}

class _MarketlerState extends State<Marketler> {
  List<Widget> marketlerListe;

  @override
  void initState() {
    super.initState();
    marketlerListe = [
      marketKarti(
        "A101 Yeni Mağazacılık A.Ş.",
        1,
       "assets/market/a101.png",
      ),
      marketKarti(
        "Asfora Gıda Ltd.Şti.",
        2,
        "assets/market/asfora.png",
      ),
      marketKarti(
        "BİM Birleşik Mağazalar A.Ş.",
        3,
        "assets/market/bim.png",
      ),
      marketKarti(
        "Özçelikkayalar Avm Petrol Tarım ve Gıda San.Tic.Ltd.Şti.",
        4,
        "assets/market/celikkayalar.png",
      ),
      marketKarti(
        "Bozkırlılar Mismar AVM",
        5,
        "assets/market/mismar.png",
      ),
      marketKarti(
        "ŞOK Marketler Ticaret A.Ş.",
        6,
        "assets/market/sok.png",
      ),
    ];
  }

  Widget marketKarti(String isim,int marketid, String resimYolu ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MarketDetay(
                      isim: isim,
                      marketid: marketid,
                      resimYolu: resimYolu,
                    )));
      },
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
                height: 80.0,
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
            Text(marketid.toString(),
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
    return Scaffold(
      appBar: AppBar(
        title: Text('Farket-Marketler'),
      ),
      body:GridView.count(
      crossAxisCount: 2,
      mainAxisSpacing: 12.0,
      crossAxisSpacing: 12.0,
      padding: EdgeInsets.all(10.0),
      childAspectRatio: 1,
      children: marketlerListe,
      ),
      );
  }
}
