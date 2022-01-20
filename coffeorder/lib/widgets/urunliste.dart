import 'package:coffeorder/models/siparis.dart';
import 'package:flutter/material.dart';

class UrunListe extends StatefulWidget {
  final String? salonno;
  final String urunyol;
  final String urunisim;
  final String urunfiyat;
  final VoidCallback? onpress;
  List<Map<String, dynamic>>? eklenenler = [];
  int urunsayisi = 0;
  UrunListe({
    Key? key,
    required this.urunyol,
    required this.urunisim,
    required this.urunfiyat,
     this.onpress,
     this.salonno,
     this.eklenenler,
  }) : super(key: key);

  @override
  State<UrunListe> createState() => _UrunListeState();
}

class _UrunListeState extends State<UrunListe> {


   @override
  void initState() {
    super.initState();
    urunisim = widget.urunisim;
    urunsayisi=widget.urunsayisi;
  }
  late String urunisim = widget.urunisim;
  late Map<String,dynamic> menusepet={"yemek":widget.urunisim,"sayisi":urunsayisi,"fiyat":widget.urunfiyat};
  late int urunsayisi = widget.urunsayisi;
  
  @override
  Widget build(BuildContext context) {
   
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListTile(
        leading: Container(
          width: 85,
          height: 85,
          child: Image.asset(
            widget.urunyol,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(widget.urunisim),
        subtitle: Text(widget.urunfiyat + "TL"),
        trailing: Wrap(
          spacing: 5, // space between two icons
          children: <Widget>[
            ElevatedButton(
              child: Text("-"),
              onPressed: () {
                if (urunsayisi == 0) {
                  return null;
                } else {
                  menusepet.update("sayisi", (value) => value=value-1); 
                     print(menusepet["yemek"]);
                  print(menusepet); 
                  setState(() {
                    urunsayisi = (urunsayisi - 1);
                  });
                }
              },
            ),
            Text(urunsayisi.toString(),style: TextStyle(fontSize: 18),),
            ElevatedButton(
              child: Text("+"),
              onPressed: () {   
                   menusepet.forEach((key, value) {
      
       if(key=="sayisi"&&value==0)
       {
          widget.eklenenler!.add(menusepet);
       }
      });
                menusepet.update("sayisi", (value) => value=value+1);          
                 print(menusepet["yemek"]);
                  print(menusepet);
                  setState(() {
                    urunsayisi = (urunsayisi +1);
                  });
              },
            ),
          ],
        ),
      ),
    );
  }
}
