import 'dart:async';
import 'dart:io';

import 'package:coffeorder/models/urun.dart';
import 'package:sqflite/sqflite.dart';
import "package:path_provider/path_provider.dart";
import 'package:sqflite/sqflite.dart';
import "package:path/path.dart";
class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;
  String _id = "id";
  String _menutablo = "menutablo";
  String _urunisim = "urunisim";
  String _urunfiyat="urunfiyat";
  //String _urunmiktari="urunmiktari";
  /*
  String _id = "id";
  String _ver = "ver";
  String _time = "time";
  String _lasttime = "lasttime";
*/
  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper.asd();
      print("nulldi yeni oluştu");
      return _databaseHelper!;
    }
    print("var olan kullanıldı");
    return _databaseHelper!;
  }

  DatabaseHelper.asd();

   Future<Database?> _getDatabase() async {
    if (_database == null) {
      print("DB null di oluşuyor");
      _database = await initializeDatabase();
    }
    return _database;
  }
   initializeDatabase() async {
    Directory klasor = await getApplicationDocumentsDirectory();
    String path = join(klasor.path, "urunler.db");
    print("DB PATH: " + path);
    var ogrencidb = openDatabase(path, version: 1, onCreate: createdatabase);
    return ogrencidb;
  }
   FutureOr<void> createdatabase(Database db, int version) async {
    print("create db metod çalıştı tablo oluşuyor...");
    await db.execute(
        "CREATE TABLE $_menutablo ($_id INTEGER PRIMARY KEY AUTOINCREMENT, $_urunisim TEXT, $_urunfiyat INTEGER )");
  }
  Future<int?> urunekle(Urun urun) async {
    var db = await _getDatabase();
    var sonuc =
        await db?.insert(_menutablo, urun.toMap(), nullColumnHack: "$_id");
    print("urun db ye eklendi");
    return sonuc;
  }
   Future<List<Map<String, dynamic>?>?> tumurunler() async {
    var db = await _getDatabase();
    var sonuc = await db?.query("$_menutablo", orderBy: "$_id ASC");
    return sonuc;
  }
  
  Future verisil(String urunadi) async {
    var db = await _getDatabase();
    await db?.delete(_menutablo,
        where: "$_urunisim = ? ", whereArgs: [urunadi]);
  }
   Future<int?> plakaguncelle(Urun urun) async {
    var db = await _getDatabase();
    var sonuc = await db?.update("$_menutablo", urun.toMap(),
        where: "$_urunisim = ?", whereArgs: [urun.urunisim]);
    return sonuc;
  }
   Future <List<Map<String, Object?>>?> plakaverigetir(String urunadi) async {
    var db = await _getDatabase();
    List<Map<String, Object?>>? maps = await db?.query(_menutablo,
        columns: [_id,_urunisim, _urunfiyat,],
        where: "$_urunisim = ? ",
        whereArgs: [urunadi]);    
      //print(maps!.length.toString());  
      
    //  maps[0]["urunfiyat"]=(int.parse(maps["urunfiyat"])+1).toString();
      return maps;
  }
}