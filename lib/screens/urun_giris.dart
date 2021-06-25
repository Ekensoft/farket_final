import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:farket/models/urun.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:farket/screens/barcode.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class UrunGirisSayfasi extends StatefulWidget {
  @override
  _UrunGirisSayfasiState createState() => _UrunGirisSayfasiState();
}

class _UrunGirisSayfasiState extends State<UrunGirisSayfasi> {

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
/*
  FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
  firebase_storage.FirebaseStorage storage =  firebase_storage.FirebaseStorage.instanceFor(app: secondaryApp);

  FirebaseApp secondaryApp = Firebase.app('SecondaryApp');
  firebase_storage.FirebaseStorage storage =
  firebase_storage.FirebaseStorage.instanceFor(app: secondaryApp);

  firebase_storage.FirebaseStorage storage =
  firebase_storage.FirebaseStorage.instanceFor(
      bucket: 'secondary-storage-bucket');

  Future<void> listExample() async {
    firebase_storage.ListResult result =
    await firebase_storage.FirebaseStorage.instance.ref().listAll();

    result.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });

    result.prefixes.forEach((firebase_storage.Reference ref) {
      print('Found directory: $ref');
    });
  }
*/

  List<Uruns> allUruns = List<Uruns>();
  var _cont_Barkodid = TextEditingController();
  var _cont_Adi = TextEditingController();
  var _cont_Aciklama = TextEditingController();
  var _cont_ResimYolu = TextEditingController();

  var _formKey = GlobalKey<FormState>();
  int clickedUrunID;

  var __cont_Adi = "";
  var __cont_Aciklama = "";

  @override
  void initState() {
    super.initState();
    urunGetir();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: Text("Ürünlerim"),
        ),
        body: Container(
            child: Column(children: <Widget>[
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                buildForm(_cont_Barkodid, "Barkodu"),
                buildForm(_cont_Adi, "Ürün Adı"),
                buildForm(_cont_Aciklama, "Açıklama"),
                buildForm(_cont_ResimYolu, "Resim Yolu")
              ])),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                buildButton("Kaydet", Colors.green, urunKaydet),
                buildButton("Güncelle", Colors.yellow, urunGuncelle),
                buildButton("Sil", Colors.red, urunSil),
                buildButton("Getir", Colors.blue, urunGetir)
              ]),
          ListTile(
            title: Text(__cont_Adi),
            subtitle: Text(__cont_Aciklama),
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: allUruns.length,
                  itemBuilder: (context, index) {
                    return Card(
                        child: ListTile(
                            onTap: () {
                              setState(() {
                                _cont_Barkodid.text = allUruns[index].barkodid;
                                _cont_Adi.text = allUruns[index].adi;
                                _cont_Aciklama.text = allUruns[index].aciklama;
                                _cont_ResimYolu.text =
                                    allUruns[index].resimyolu;
                                clickedUrunID = allUruns[index].id;
                              });
                            },
                            title: Text(allUruns[index].adi),
                            subtitle: Text(allUruns[index].aciklama),
                            trailing: GestureDetector(
                              onTap: () {
                                //  _deleteUrun(allUruns[index].id, index);
                              },
                              child: Icon(Icons.delete),
                            )));
                  }))
        ])));
  }

  Widget buildForm(TextEditingController txtController, String str) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextFormField(
            autofocus: false,
            controller: txtController,
            decoration:
                InputDecoration(labelText: str, border: OutlineInputBorder())));
  }

  Widget buildButton(String str, Color buttonColor, Function eventFunc) {
    return ElevatedButton(
      child: Text(str),
      // color: buttonColor,
      onPressed: () {
        eventFunc();
      },
    );
  }


  void urunKaydet() async {
/*
    firebase_storage.ListResult result =
    await firebase_storage.FirebaseStorage.instance.ref('market').listAll();

    result.items.forEach((element) {print (element);});

    result.items.forEach((firebase_storage.Reference ref) {
      print('Found file: $ref');
    });

    result.prefixes.forEach((firebase_storage.Reference ref) {
      print('Found directory: $ref');
    });
*/
 /*   Future<void> listExample() async {
      firebase_storage.ListResult result = await firebase_storage
          .FirebaseStorage.instance
          .ref('urun')
          .list(firebase_storage.ListOptions(maxResults: 10));
      // ...
    }



    Future<void> downloadURLExample() async {
      String downloadURL = await firebase_storage.FirebaseStorage.instance
          .ref('urun/aycicekyagi_evin_pet_5lt.jpg')
          .getDownloadURL();

      // Within your widgets:
       Image.network(downloadURL);
    }


    var earringsRef = await firebase_storage.FirebaseStorage.instance.ref('urun').child("aycicekyagi_evin_pet_5lt.jpg");
    var downloadURL = await earringsRef.getDownloadURL();
    print(downloadURL);

    var url = Uri.parse(await earringsRef.getDownloadURL() as String);
    print(url);
    Image.network(downloadURL);


*/

    if (_formKey.currentState.validate()) {
      await Firebase.initializeApp();
      await FirebaseFirestore.instance
          .collection("urunler")
          .doc(_cont_Barkodid.text)
          .set({
        'barkodid': _cont_Barkodid.text,
        'adi': _cont_Adi.text,
        'aciklama': _cont_Aciklama.text,
        'resimyolu': _cont_ResimYolu.text
      }).whenComplete(() => print("Veri Eklendi."));
    }
  }

  void urunGetir() async {
    FirebaseFirestore.instance
        .collection("urunler")
        .doc(_cont_Barkodid.text)
        .get()
        .then((gelenUrun) {
      setState(() {
        _cont_Barkodid = gelenUrun.data()["barkodid"];
        _cont_Adi = gelenUrun.data()["adi"];
        _cont_Aciklama = gelenUrun.data()["aciklama"];
        _cont_ResimYolu = gelenUrun.data()["resimyolu"];

        __cont_Adi = gelenUrun.data()["adi"];
        __cont_Aciklama = gelenUrun.data()["aciklama"];
        print("-database--");
        print(gelenUrun.data()["adi"]);
        print(gelenUrun.data()["aciklama"]);
      });
    });
  }

  void urunGuncelle() {
    //   if (clickedUrunID != null) {
    if (_cont_Barkodid.text != null) {
      if (_formKey.currentState.validate()) {
        FirebaseFirestore.instance
            .collection("urunler")
            .doc(_cont_Barkodid.text)
            .update({
          'barkodid': _cont_Barkodid.text,
          'adi': _cont_Adi.text,
          'aciklama': _cont_Aciklama.text,
          'resimyolu': _cont_ResimYolu.text
        }).whenComplete(() => print("Veri Güncellendi."));
      }
    } else {
      alert();
    }
  }

  void urunSil() {
    //   if (clickedUrunID != null) {
    if (_cont_Barkodid.text != null) {
      FirebaseFirestore.instance
          .collection("urunler")
          .doc(_cont_Barkodid.text)
          .delete()
          .whenComplete(() => print("Veri Silindi."));
    } else {
      alert();
    }
  }

  void alert() {
    AlertDialog alert = AlertDialog(
      title: Text("Seçili Ürün Yok!"),
      content: Text("Lütfen bir ürün seçerek güncelleme işlemi yapınız!"),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
