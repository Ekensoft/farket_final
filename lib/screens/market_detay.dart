import 'package:flutter/material.dart';

class MarketDetay extends StatelessWidget {
  final String isim;
  final int marketid;
  final String resimYolu;

  const MarketDetay({Key key, this.isim, this.marketid, this.resimYolu})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Farket-Market Detay'),
        ),
        body: ListView(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag: resimYolu,
                  child: Center(
                    child: Image.asset(
                      resimYolu,
                    ),
                  ),
                ),
              ],
            ),
            Column(
              children: <Widget>[
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  isim,
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  marketid.toString(),
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[400],
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                  child: Text(
                      "Bu bölümde bu mağazadan fiyat araştırması yapılan ürünlerin fiyatları girilecek.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                      )),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Container(
                  width: MediaQuery.of(context).size.width - 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    color: true ? Colors.red[400] : Colors.black,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Center(
                    child: Text(
                      true ? "Ürünleri Lİstele" : "Stokta Yok",
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ));
  }
}
