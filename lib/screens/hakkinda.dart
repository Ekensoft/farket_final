import 'package:flutter/material.dart';
class Hakkinda extends StatefulWidget {
  @override
  _HakkindaState createState() => _HakkindaState();
}
class _HakkindaState extends State<Hakkinda> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Farket-Hakkında'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('Farket-Fiyatları Farket Daha Hesaplı Alışveriş Yap.',style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 20.0,
              ),
              Text('Farklı marketlerde Aynı marka ürünlerin fiyatlarını karşılaştırarak ürünleri hesaplı bir şekilde almamızı sağlamaktadır.',style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 20.0,
              ),
              Text('Alışveriş Listemizi oluşturduktan sonra Farklı marketlerde araştırma yaparak fiyatları giriyoruz. Program Daha sonra Hangi ürünün hangi marketten hesaplı olarak alacağımız listeyi vermektedir. Program database yapısını öğrendikten sonra Aynı şehirdeki kişiler birbirlerin fiyat araştırmasını gösterecek şekilde ayarlanacaktır.',style: TextStyle(fontSize: 20),),
              SizedBox(
                height: 20.0,
              ),
              Text('Bu uygulama Dr. Öğretim Üyesi Ahmet Cevahir ÇINAR tarafından yürütülen 3311456 kodlu MOBİL PROGRAMLAMA dersi kapsamında 193311076 numaralı Öğrenci Bekir EKEN tarafından 30 Nisan 2021 günü yapılmıştır. ',style: TextStyle(fontSize: 20),),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),

                ),
            ],
          ),
        ),
      ),
    );
  }
}