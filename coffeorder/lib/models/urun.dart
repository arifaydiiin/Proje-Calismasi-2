// To parse this JSON data, do
//
//     final urun = urunFromMap(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

Urun urunFromMap(String str) => Urun.fromMap(json.decode(str));

String urunToMap(Urun data) => json.encode(data.toMap());

class Urun {
    Urun({
        this.id,
        required this.urunisim,
        required this.urunfiyat,
    });

    String? id;
    String urunisim;
    int urunfiyat;

    factory Urun.fromMap(Map<String, dynamic> json) => Urun(
        id: json["id"] == null ? null : json["id"],
        urunisim: json["urunisim"] == null ? null : json["urunisim"],
        urunfiyat: json["urunfiyat"] == null ? null : json["urunfiyat"],
    );

    Map<String, dynamic> toMap() => {
        "id": id == null ? id : id,
        "urunisim": urunisim == null ? null : urunisim,
        "urunfiyat": urunfiyat == null ? null : urunfiyat,
    };
}
