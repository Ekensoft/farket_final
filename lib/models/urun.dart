class Uruns {
  int id; // her ürüne kolayca ulaşmak adına bir id,
  String barkodid; //Borkod ve ürün birlikteliği için
  String adi; // her ürün için bir ad,
  String aciklama; //her ürün için bir açıklama tanımladık.
  String resimyolu;
  Uruns(this.barkodid,this.adi, this.aciklama,this.resimyolu); // Constructor'ımızı oluşturduk.
  //Ekleme işlemlerinde direkt olarak id atadığı için id kullanmadık.
  Uruns.withId(this.id, this.barkodid,this.adi, this.aciklama,this.resimyolu);
  // Silme ve güncelleme gibi işlemler için ise id'li bir constructor oluşturduk.

//Sqlite'da devamlı "map"ler ile çalışacağımız için yardımcı methodlarımızı hazırlayalım.
//Verilerimizi okurken de map olarak okuyacağız, nesnemizi yazdırırken de map'e çevireceğiz.

  Map<String, dynamic> toMap() {
    var map = Map<String, dynamic>(); //Geçici bir map nesnesi
    map["id"] = id;
    map["id"] = barkodid;
    map["adi"] = adi;
    map["aciklama"] = aciklama;
    map["resimyolu"] = resimyolu;
    return map; //Bu mapimizi döndürüyoruz.
  }

  Uruns.fromMap(Map<String, dynamic> map) {
    this.id = map["id"];
    this.barkodid = map["barkodid"];
    this.adi = map["adi"];
    this.aciklama = map["aciklama"];
    this.resimyolu = map["resimyolu"];
  }
}