import 'package:coffeorder/models/siparis.dart';
import 'package:coffeorder/pages/menuListesi/aparetifliste.dart';
import 'package:coffeorder/pages/menuListesi/drinkslist.dart';
import 'package:coffeorder/pages/menuListesi/foodlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_plus/flutter_swiper_plus.dart';

class MenuSiparis extends StatelessWidget {
   List<Map<String, dynamic>> eklenenler = [];
  final String? salonno;
     List<Siparis?>? siparisler;
   MenuSiparis({Key? key,required this.salonno,required this.eklenenler,this.siparisler}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    // return MenuListesi(width: width, height: height);
    return  AparetifListe(width: width, height: height,salonno:salonno,eklenenler:this.eklenenler,siparisler:this.siparisler);
  }
}
