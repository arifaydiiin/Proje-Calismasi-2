import 'package:coffeorder/data/siparisApiClient.dart';
import 'package:coffeorder/widgets/urunliste.dart';
import 'package:flutter/material.dart';


class FoodList extends StatefulWidget {
  FoodList({
    Key? key,
    required this.width,
    required this.height,
    required this.index,
    required this.salonno,
  }) : super(key: key);
  final String? salonno;
  final double width;
  final double height;
  int? index;

  @override
  State<FoodList> createState() => _FoodListState();
}

class _FoodListState extends State<FoodList> {
    final SiparisApiClient siparisApiClient = SiparisApiClient();
     List<Map<String, dynamic>> eklenenler = [];
  int? _listviewindex=5;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              width: widget.width,
              
              color: Color(0xff0BC1BF),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 22.0),
                      child: Text(
                        "Foods",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  Container(
                      alignment: Alignment.bottomCenter,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: widget.index! % 2 == 0
                                ? Radius.circular(80)
                                : Radius.circular(0),
                            topRight: widget.index! % 2 == 1
                                ? Radius.circular(80)
                                : Radius.circular(0)),
                      ),
                      width: widget.width,                     
                      child: Column(
                        children: [
                         UrunListe(urunyol: "lib/files/tavukdoner.jpg",urunfiyat: "14",urunisim: "Tavuk Döner",onpress: (){},salonno: widget.salonno!, eklenenler:this.eklenenler,),
                          UrunListe(urunyol: "lib/files/gozleme.jpg",urunfiyat: "10",urunisim: "Gözleme",onpress: (){},salonno: widget.salonno!,eklenenler:this.eklenenler),
                          UrunListe(urunyol: "lib/files/pizza.jpg",urunfiyat: "12",urunisim: "Pizza",onpress: (){},salonno: widget.salonno!,eklenenler:this.eklenenler),  
                           ElevatedButton(onPressed: ()async{
                            print("eklenenler güncel : "+eklenenler.toString());

                            await siparisApiClient.postdata(eklenenler,widget.salonno!);
                             Navigator.pop(context);
                            
                            
                            
                            // burda bana yemeklerin dizi map olarak post atılacak  
                            //post işlemi
                          }, child: Text("Siparişi ver"))         
                        ],
                      )),
                ],
              )),
        ],
      ),
    );
  }
}
