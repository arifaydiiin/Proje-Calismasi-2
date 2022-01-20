import 'package:coffeorder/pages/urunliste.dart';
import 'package:coffeorder/widgets/urunliste.dart';
import 'package:flutter/material.dart';

class DrawerMenu extends StatelessWidget {
  const DrawerMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menüler"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 25,
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
            UrunListesiGorunumu(
                urunyol: "lib/files/mantı.jpg",
                urunfiyat: "14",
                urunisim: "Mantı"),
            UrunListesiGorunumu(
                urunyol: "lib/files/sosistabagi.jpg",
                urunfiyat: "10",
                urunisim: "Sosis Tabağı"),
            UrunListesiGorunumu(
                urunyol: "lib/files/patateskizartma.jpg",
                urunfiyat: "12",
                urunisim: "Patates Kızartma"),
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
            UrunListesiGorunumu(
                urunyol: "lib/files/tavukdoner.jpg",
                urunfiyat: "14",
                urunisim: "Tavuk Döner"),
            UrunListesiGorunumu(
                urunyol: "lib/files/gozleme.jpg",
                urunfiyat: "10",
                urunisim: "Gözleme"),
            UrunListesiGorunumu(
                urunyol: "lib/files/pizza.jpg",
                urunfiyat: "12",
                urunisim: "Pizza"),
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
            UrunListesiGorunumu(
              urunyol: "lib/files/ayran.jpg",
              urunfiyat: "14",
              urunisim: "Ayran",
            ),
            UrunListesiGorunumu(
              urunyol: "lib/files/cay.jpg",
              urunfiyat: "14",
              urunisim: "Çay",
            ),
            UrunListesiGorunumu(
              urunyol: "lib/files/fanta.jpg",
              urunfiyat: "14",
              urunisim: "fanta",
            ),
            UrunListesiGorunumu(
              urunyol: "lib/files/icetea.jpg",
              urunfiyat: "14",
              urunisim: "İce Tea",
            ),
            UrunListesiGorunumu(
              urunyol: "lib/files/kola.jpeg",
              urunfiyat: "14",
              urunisim: "Kola",
            ),
            UrunListesiGorunumu(
                urunyol: "lib/files/nescafe.jpg",
                urunfiyat: "14",
                urunisim: "Nescafe"),
            UrunListesiGorunumu(
              urunyol: "lib/files/su.jpg",
              urunfiyat: "14",
              urunisim: "Su",
            ),
            UrunListesiGorunumu(
              urunyol: "lib/files/turkkahvesi.jpg",
              urunfiyat: "14",
              urunisim: "Türk Kahvesi",
            ),
          ],
        ),
      ),
    );
  }
}
