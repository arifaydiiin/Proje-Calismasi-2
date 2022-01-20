import 'package:coffeorder/data/siparisApiClient.dart';
import 'package:coffeorder/models/siparis.dart';
import 'package:flutter/material.dart';
class AktifSiparisler extends StatefulWidget {
  final String? salonno;
  List<Siparis?>? siparisler;

   AktifSiparisler({Key? key, required this.salonno,required this.siparisler}) : super(key: key);

  @override
  State<AktifSiparisler> createState() => _AktifSiparislerState();
}

class _AktifSiparislerState extends State<AktifSiparisler> {
   int toplam=0;
    final SiparisApiClient siparisApiClient = SiparisApiClient();
  Siparis? buraninsiparisi;

@override
void initState() {
  super.initState();
  initialsiparis();
  initialodeme();
}

  initialsiparis(){
     for(int i=0;i<widget.siparisler!.length;i++)
    {
       if(widget.siparisler![i]!.salonno.toString()==widget.salonno.toString())
       {
        buraninsiparisi=widget.siparisler![i];
       }
    }
  }
  initialodeme(){
    for(int i=0;i<buraninsiparisi!.yemekler!.length;i++)
    {
     int deger =  int.parse(buraninsiparisi!.yemekler![i]["fiyat"].toString())* int.parse(buraninsiparisi!.yemekler![i]["sayisi"].toString());
      toplam= toplam + deger;
    }
    var x = buraninsiparisi!.yemekler![0]["fiyat"];
  }
  @override
  Widget build(BuildContext context) {
   print("Aktif Siparişler"+buraninsiparisi!.yemekler![0]["yemek"]);

    return Scaffold(

      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()async{
          await siparisApiClient.siparistemizle(widget.salonno!);
          Navigator.pop(context);
          }, icon: Icon(Icons.delete))
        ],
        title: Text("Masa No: "+buraninsiparisi!.salonno.toString()),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount:  buraninsiparisi!.yemekler!.length,
              itemBuilder:(context,index){
                if(buraninsiparisi!.yemekler![index]["sayisi"]==0)
                {
                  return SizedBox();
                } 
                return ListTile(      
                title: Text(buraninsiparisi!.yemekler![index]["yemek"] +" Adet: "+buraninsiparisi!.yemekler![index]["sayisi"].toString()),
                trailing: Text(buraninsiparisi!.yemekler![index]["fiyat"]+"TL"),
              ); 
              }),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
               Text("Toplam Fiyat: "+toplam.toString()+" TL"),
              ElevatedButton.icon(onPressed: ()async{
                 await siparisApiClient.siparistemizle(widget.salonno!); 
                     
                 await showDialog(context: context, builder: (context)
                 {
                  return AlertDialog(
                   title: Text("Ödeme"),
                   content: Text("Ödeme tamamlanmıştır"),                   
                 );
                 });
                  Navigator.pop(context);
              }, icon: Icon(Icons.shopping_basket), label: Text("Ödeme Al")),
             
            ],
          ),
          SizedBox(
            height: 30,
          ),
        ],
      )
    );
  }
}






