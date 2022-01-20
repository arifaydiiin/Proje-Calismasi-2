import 'dart:convert';
import 'dart:io';

import 'package:coffeorder/models/siparis.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import "package:http/http.dart" as http;

enum Mode { Test, Online }

class SiparisApiClient {
  Enum mode = Mode.Test;
  static const baseurl = "https://evening-mesa-43387.herokuapp.com";
  static const testbaseurl = "http://localhost:3000";
  final http.Client httpClient = http.Client();
  Dio dio = Dio();

  Future postdata(List<Map<String, dynamic>> gelendata,String salonno) async {
    print("Dio post Kısmına girildi");
    
    try {
      var yenigelendata = await dio.patch(
        "https://evening-mesa-43387.herokuapp.com/$salonno",
        data: {"yemekler":gelendata,"salonno":salonno},
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
       
      );
       print("patch işlemi başarılı");
       print("gönderilen data: "+gelendata.toString());
    } catch (e) {
      debugPrint("patch DATA Hata var :" + e.toString());
    }
  }
   
  Future siparistemizle(String salonno) async {
    try {
      var yenigelendata = await dio.patch(
        "https://evening-mesa-43387.herokuapp.com/$salonno",
        data: {"yemekler":[],"salonno":salonno},
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json",
        }),
       
      );
       print("silme işlemi başarılı");
      
    } catch (e) {
      debugPrint("patch DATA Hata var :" + e.toString());
    }
  }

  Future<List<Siparis?>?> tumsiparislerigetir() async {
    print("Buraya girildi.");
    var yenigelendata = await dio.get(
      "https://evening-mesa-43387.herokuapp.com/siparislergetir",
    );
    print("Buraya girildi2.");
    var donusmushali =
        ((yenigelendata.data) as List).map((e) => Siparis.fromJson(e)).toList();
        print("Buraya girildi3.");
    //print(donusmushali[0].salonno);
    return donusmushali;
  }
}
