import 'package:coffeorder/data/databasehelper.dart';
import 'package:coffeorder/data/siparisApiClient.dart';
import 'package:coffeorder/models/siparis.dart';
import 'package:coffeorder/models/urun.dart';
import 'package:coffeorder/widgets/urunliste.dart';
import 'package:flutter/material.dart';

class AparetifListe extends StatefulWidget {
 List<Map<String, dynamic>> eklenenler = [];
 List<Siparis?>? siparisler;
  AparetifListe({
    Key? key,
    required this.width,
    required this.height,
    required this.salonno,
    required this.eklenenler,
    this.siparisler,
  }) : super(key: key);
  final String? salonno;
  final double width;
  final double height;
  

  @override
  State<AparetifListe> createState() => _AparetifListeState();
}

class _AparetifListeState extends State<AparetifListe> {
    DatabaseHelper dh1 = DatabaseHelper();
  final SiparisApiClient siparisApiClient = SiparisApiClient();

  int? _listviewindex = 3;

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
                        "Menü",
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
                            topLeft: Radius.circular(80),
                              
                            topRight:Radius.circular(80)
                              ),
                      ),
                      width: widget.width,
                    
                      child: Column(
                        children: [
                          SizedBox(
                            height: 40,
                          ),
                          Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container( 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color:Colors.blueGrey)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Aparatifler",style: TextStyle(fontSize: 25),),
                ),
              ),
            ),
                          UrunListe(urunyol: "lib/files/mantı.jpg",urunfiyat: "14",urunisim: "mantı",onpress: (){},salonno: widget.salonno!,eklenenler: widget.eklenenler,),
                          UrunListe(urunyol: "lib/files/sosistabagi.jpg",urunfiyat: "10",urunisim: "sosistabagi",onpress: (){},salonno: widget.salonno!,eklenenler:widget.eklenenler),
                          UrunListe(urunyol: "lib/files/patateskizartma.jpg",urunfiyat: "12",urunisim: "patateskizartma",onpress: (){},salonno: widget.salonno!,eklenenler: widget.eklenenler), 
                          Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container( 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color:Colors.blueGrey)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Foods",style: TextStyle(fontSize: 25),),
                ),
              ),
            ), 
                          UrunListe(urunyol: "lib/files/tavukdoner.jpg",urunfiyat: "14",urunisim: "döner",onpress: (){},salonno: widget.salonno!, eklenenler:widget.eklenenler),
                          UrunListe(urunyol: "lib/files/gozleme.jpg",urunfiyat: "10",urunisim: "gozleme",onpress: (){},salonno: widget.salonno!,eklenenler:widget.eklenenler),
                          UrunListe(urunyol: "lib/files/pizza.jpg",urunfiyat: "12",urunisim: "pizza",onpress: (){},salonno: widget.salonno!,eklenenler:widget.eklenenler), 
                           Padding(
              padding: const EdgeInsets.only(left: 12),
              child: Container( 
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color:Colors.blueGrey)
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Drinks",style: TextStyle(fontSize: 25),),
                ),
              ),
            ),
                           UrunListe(urunyol: "lib/files/ayran.jpg",urunfiyat: "14",urunisim: "ayran",onpress: (){},salonno: widget.salonno!,eklenenler: widget.eklenenler),
                          UrunListe(urunyol: "lib/files/cay.jpg",urunfiyat: "14",urunisim: "çay",onpress: (){},salonno: widget.salonno!,eklenenler: widget.eklenenler),
                          UrunListe(urunyol: "lib/files/fanta.jpg",urunfiyat: "14",urunisim: "fanta",onpress: (){},salonno: widget.salonno!,eklenenler:widget.eklenenler),
                          UrunListe(urunyol: "lib/files/icetea.jpg",urunfiyat: "14",urunisim: "icetea",onpress: (){},salonno: widget.salonno!,eklenenler: widget.eklenenler),
                          UrunListe(urunyol: "lib/files/kola.jpeg",urunfiyat: "14",urunisim: "kola",onpress: (){},salonno: widget.salonno!,eklenenler:widget.eklenenler),
                          UrunListe(urunyol: "lib/files/nescafe.jpg",urunfiyat: "14",urunisim: "nescafe",onpress: (){},salonno: widget.salonno!,eklenenler:widget.eklenenler),
                          UrunListe(urunyol: "lib/files/su.jpg",urunfiyat: "14",urunisim: "su",onpress: (){},salonno: widget.salonno!,eklenenler:widget.eklenenler),
                          UrunListe(urunyol: "lib/files/turkkahvesi.jpg",urunfiyat: "14",urunisim: "türkkahvesi",onpress: (){},salonno: widget.salonno!,eklenenler: widget.eklenenler,),
                          ElevatedButton(onPressed: ()async{
                            print("eklenenler güncel : "+widget.eklenenler.toString());

                            await siparisApiClient.postdata(widget.eklenenler,widget.salonno!);
                            //await siparisApiClient.tumsiparislerigetir();
                            List items=[];
                            List miktarlar=[];
                            int miktar =0;
                             widget.eklenenler.forEach((element) {
                               print(element["yemek"].toString().toLowerCase());
                                items.add(element["yemek"].toString().toLowerCase());
                                miktarlar.add(element["sayisi"].toString());
                              });
                              print("items length: "+items.length.toString());
                            for(int i=0;i<items.length;i++)
                            {
                             print("item $i. "+items[i].toString());
                              var veri = await dh1.plakaverigetir(
                                    items[i].toString().toLowerCase());
                               
                                    String id = veri![0]["id"].toString();
                                String urunisim =
                                    veri[0]["urunisim"].toString();
                                int urunfiyat =
                                    int.parse(veri[0]["urunfiyat"].toString());
                                dh1.plakaguncelle(Urun(
                                    id: id,
                                    urunfiyat: urunfiyat - int.parse(miktarlar[i]),
                                    urunisim: urunisim));
                            }
                             Navigator. pop(context);
                            
                            
                            
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



/* 
ListView.builder(
                          itemCount: _listviewindex,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.only(top: 25.0, left: 15),
                              child: Column(
                                children: [
                                  ListTile(
                                      leading: CircleAvatar(
                                        radius: 44,
                                        child: Text("A"),
                                      ), // Circular resim eklenicek
                                      title: Text("Ürün $index"),
                                      subtitle: Text("Ürün Fiyatı  \$25 "),
                                      trailing: IconButton(
                                        icon: Icon(Icons.add),
                                        onPressed: ()async {
                                          
                                          //print(aktifsiparisler![0]!.yemekler![0]!.yemek.toString());
                                        },
                                      )),
                                       index==_listviewindex!-1 ? SizedBox(height:100 ,) :SizedBox(),
                                ],
                              ),
                            );
                          })
*/