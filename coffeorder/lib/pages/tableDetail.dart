import 'package:coffeorder/models/siparis.dart';
import 'package:coffeorder/pages/menusiparis.dart';
import 'package:flutter/material.dart';

class TableDetail extends StatefulWidget {
  List<Map<String, dynamic>> eklenenler = [];
  String? salonno;
    List<Siparis?>? siparisler;
  TableDetail({Key? key, this.salonno, required this.eklenenler,this.siparisler})
      : super(key: key);

  @override
  State<TableDetail> createState() => _TableDetailState();
}

class _TableDetailState extends State<TableDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton(
          //     onPressed: () {
          //       print("tabledeki eklenenler length : " +
          //           widget.eklenenler.length.toString());
          //       widget.eklenenler.clear();
          //       print("tabledeki eklenenler length : " +
          //           widget.eklenenler.length.toString());
                   
          //     },
          //     icon: Icon(Icons.add_box)),
        ],
        elevation: 0,
        backgroundColor: Color(0xff0BC1BF),
        title: Text("Masa ${widget.salonno} Sipariş Detayları"),
      ),
      body: MenuSiparis(
        siparisler: widget.siparisler,
        salonno: widget.salonno,
        eklenenler: this.widget.eklenenler,
      ),
    );
  }
}
