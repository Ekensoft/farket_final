import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:farket/models/urun.dart';

class DatabaseHelper {
  static Database _database;

  String _urunsTable = "uruns";
  String _columnID = "id";
  String _columnAdi = "adi";
  String _columnAciklama = "aciklama";
  String _columnResimYolu = "resimyolu";

  Future<Database> get database async {
    if (_database == null) {
      _database = await initializeDatabase();
    }
    return _database;
  }

  Future<Database> initializeDatabase() async {
    String dbPath = join(await getDatabasesPath(), "uruns.db");
    var urunsDb = await openDatabase(dbPath, version: 1, onCreate: createDb);
    return urunsDb;
  }

  void createDb(Database db, int version) async {
    await db.execute(
        "Create table $_urunsTable($_columnID integer primary key, $_columnAdi text, $_columnAciklama text, $_columnResimYolu text)");
  }

  // Crud Methods

// Uygulama açıldığında tüm ürünleri alıp getirmemize yardımcı olan methodumuz.
// Burada bir db değişkeni oluşturarak var olan database'imizi çağırarak değişkene atıyoruz.
// Ardından db üzerinden bir sql sorgusu ile tüm tabloyu çağırıyor
// ve listeye dönüştürmek için fromMap methodumuzu kullanıyoruz.
  Future<List<Uruns>> getAllUruns() async {
    Database db = await this.database;
    var result = await db.query("$_urunsTable");
    return List.generate(result.length, (i) {
      return Uruns.fromMap(result[i]);
    });
  }

  Future<int> insert(Uruns urun) async {
    //Bir db değişkeni oluşturarak var olan database'imizi çağırarak değişkene atıyoruz.
    Database db = await this.database;
    //daha sonrasında db üzerinden insert methodunu kullanarak ekleme işlemini yapıyoruz.
    //insert methodu bizden gelen verinin ekleneceği tabloyu, eklenecek veriyi(burda map'e çeviriyoruz)
    var result = await db.insert("$_urunsTable", urun.toMap());
    return result;
  }

//Urun güncelleme işleminde de ilk olarak Urun ekleme işlemindeki gibi database'i alıyoruz.
  Future<int> update(Uruns urun) async {
    Database db = await this.database;
    //Daha sonra update metoduyla gelen ürün güncelleme işlemine gönderiyoruz burada where ve whereArgs
    //parametreleri isteniyoruz bizden. Where için columnId değerini, whereArgs için ise gelen urun objesinin
    //id değerini gönderiyoruz.
    var result = await db.update("$_urunsTable", urun.toMap(),
        where: "id=?", whereArgs: [urun.id]);
    return result;
  }

//Urun silme işleminde de ilk olarak Urun ekleme ve güncelleme işlemindeki gibi database'i alıyoruz.
//Urun silme işlemimiz de ise parametre olarak sadece id göndermemiz işimizi görecektir.
  Future<int> delete(int id) async {
    //Urun silme işleminde de ilk olarak ürün ekleme işlemindeki gibi database'i alıyoruz.
    Database db = await this.database;
    //Daha sonra database'den ilgili id'deki değerleri delete etmesini istiyoruz.
    var result = await db.rawDelete("delete from $_urunsTable where id=$id");
    return result;
  }
}
