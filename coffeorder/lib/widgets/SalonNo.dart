import 'package:coffeorder/models/siparis.dart';
import 'package:coffeorder/pages/aktifsiparisler.dart';
import 'package:coffeorder/pages/tableDetail.dart';
import "package:flutter/material.dart";

class SalonButton extends StatelessWidget {
  String? salonno;
  String? kisino;
  bool? siparisvarmi;
  List<Siparis?>? siparisler;
   List<Map<String, dynamic>> eklenenler = [];
  SalonButton({this.salonno,this.kisino,this.siparisvarmi,this.siparisler});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        siparisvarmi==true ? Navigator.push(context, MaterialPageRoute(builder: (context)=> AktifSiparisler(salonno:salonno,siparisler: siparisler,))) :  
        Navigator.push(context, MaterialPageRoute(builder: (context)=> TableDetail(salonno: salonno,eklenenler:this.eklenenler ,siparisler: siparisler)));
      },
      child:Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15),
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomLeft,
              end: Alignment.topRight,
              colors: siparisvarmi == true ? [Colors.red,Colors.red] : [Colors.green, Colors.blue] ,
            ),
            color: Colors.teal[100],
            borderRadius: BorderRadius.circular(12)),
        padding: EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(),
            Text(
              salonno!,
              style: TextStyle(fontSize: 28),
            ),
            Text(kisino!+ " Kişilik", style: TextStyle(fontSize: 17)),
          ],
        ),
      ),
    ),
    );
  }
}
