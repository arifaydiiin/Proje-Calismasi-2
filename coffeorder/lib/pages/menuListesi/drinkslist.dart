import 'package:coffeorder/data/siparisApiClient.dart';
import 'package:coffeorder/widgets/urunliste.dart';
import 'package:flutter/material.dart';


class DrinksList extends StatefulWidget {
  DrinksList({
    Key? key,
    required this.width,
    required this.height,
    required this.index,required this.salonno,
  }) : super(key: key);
  final String? salonno;
  final double width;
  final double height;
  int? index;

  @override
  State<DrinksList> createState() => _DrinksListState();
}

class _DrinksListState extends State<DrinksList> {
    final SiparisApiClient siparisApiClient = SiparisApiClient();
     List<Map<String, dynamic>> eklenenler = [];
  int? _listviewindex=9;

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
                        "Drinks",
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
                     
                     
                      child: Column(   
                        children: [
                         UrunListe(urunyol: "lib/files/ayran.jpg",urunfiyat: "14",urunisim: "Ayran",onpress: (){},salonno: widget.salonno!,eklenenler: this.eklenenler,),
                          UrunListe(urunyol: "lib/files/cay.jpg",urunfiyat: "14",urunisim: "Çay",onpress: (){},salonno: widget.salonno!,eklenenler: this.eklenenler,),
                          UrunListe(urunyol: "lib/files/fanta.jpg",urunfiyat: "14",urunisim: "fanta",onpress: (){},salonno: widget.salonno!,eklenenler: this.eklenenler,),
                          UrunListe(urunyol: "lib/files/icetea.jpg",urunfiyat: "14",urunisim: "İce Tea",onpress: (){},salonno: widget.salonno!,eklenenler: this.eklenenler,),
                          UrunListe(urunyol: "lib/files/kola.jpeg",urunfiyat: "14",urunisim: "Kola",onpress: (){},salonno: widget.salonno!,eklenenler: this.eklenenler,),
                          UrunListe(urunyol: "lib/files/nescafe.jpg",urunfiyat: "14",urunisim: "Nescafe",onpress: (){},salonno: widget.salonno!,eklenenler: this.eklenenler,),
                          UrunListe(urunyol: "lib/files/su.jpg",urunfiyat: "14",urunisim: "Su",onpress: (){},salonno: widget.salonno!,eklenenler: this.eklenenler,),
                          UrunListe(urunyol: "lib/files/turkkahvesi.jpg",urunfiyat: "14",urunisim: "Türk Kahvesi",onpress: (){},salonno: widget.salonno!,eklenenler: this.eklenenler,),  
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
