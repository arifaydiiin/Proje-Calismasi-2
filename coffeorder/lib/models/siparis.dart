
import 'dart:convert';


Siparis siparisFromJson(String str) => Siparis.fromJson(json.decode(str));

String siparisToJson(Siparis data) => json.encode(data.toJson());

class Siparis {
    Siparis({
        required this.id,
        required this.yemekler,
        required this.salonno,
        required this.v,
    });

    String? id;
    List<dynamic>? yemekler;
    String? salonno;
    int? v;

    factory Siparis.fromJson(Map<String, dynamic> json) => Siparis(
        id: json["_id"] == null ? null : json["_id"],
        yemekler: json["yemekler"] == null ? null : List<dynamic>.from(json["yemekler"].map((x) => x)),
        salonno: json["salonno"] == null ? null : json["salonno"],
        v: json["__v"] == null ? null : json["__v"],
    );

    Map<String, dynamic> toJson() => {
        "_id": id == null ? null : id,
        "yemekler": yemekler == null ? null : List<dynamic>.from(yemekler!.map((x) => x)),
        "salonno": salonno == null ? null : salonno,
        "__v": v == null ? null : v,
    };
}
