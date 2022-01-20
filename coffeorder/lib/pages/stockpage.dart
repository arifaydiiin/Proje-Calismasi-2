import 'package:coffeorder/data/databasehelper.dart';
import 'package:coffeorder/models/urun.dart';
import 'package:flutter/material.dart';

class StockPage extends StatefulWidget {
  StockPage({Key? key}) : super(key: key);

  @override
  _StockPageState createState() => _StockPageState();
}

class _StockPageState extends State<StockPage> {
  DatabaseHelper dh1 = DatabaseHelper();
  @override
  Widget build(BuildContext context) {
    //dh1.plakaverigetir("Çay");
    dh1.tumurunler().then((value) {
      int? sayi = value?.length;
      print(value?.length.toString());
      if (sayi! < 1) {
        dh1.urunekle(Urun(id: "1", urunisim: "döner", urunfiyat: 45));
        dh1.urunekle(Urun(id: "2", urunisim: "gozleme", urunfiyat: 4));
        dh1.urunekle(Urun(id: "3", urunisim: "pizza", urunfiyat: 84));
        dh1.urunekle(Urun(id: "4", urunisim: "mantı", urunfiyat: 92));
        dh1.urunekle(Urun(id: "5", urunisim: "sosistabagi", urunfiyat: 68));
        dh1.urunekle(Urun(id: "6", urunisim: "patateskizartma", urunfiyat: 45));
        dh1.urunekle(Urun(id: "7", urunisim: "ayran", urunfiyat: 4));
        dh1.urunekle(Urun(id: "8", urunisim: "çay", urunfiyat: 84));
        dh1.urunekle(Urun(id: "9", urunisim: "fanta", urunfiyat: 92));
        dh1.urunekle(Urun(id: "10", urunisim: "icetea", urunfiyat: 68));
        dh1.urunekle(Urun(id: "11", urunisim: "kola", urunfiyat: 45));
        dh1.urunekle(Urun(id: "12", urunisim: "nescafe", urunfiyat: 4));
        dh1.urunekle(Urun(id: "13", urunisim: "su", urunfiyat: 84));
        dh1.urunekle(Urun(id: "14", urunisim: "türkkahvesi", urunfiyat: 92));
        setState(() {});
      }
    });
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder<List<Map<String, dynamic>?>?>(
              future: dh1.tumurunler(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                if (snapshot.hasData) {
                  return ListView.builder(
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        var veriler = snapshot.data![index]!;
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ListTile(
                              onLongPress: ()async{
                                var veri = await dh1.plakaverigetir(
                                    snapshot.data![index]!["urunisim"]);
                                print(veri![0]);
                                String id = veri[0]["id"].toString();
                                String urunisim =
                                    veri[0]["urunisim"].toString();
                                int urunfiyat =
                                    int.parse(veri[0]["urunfiyat"].toString());
                                dh1.plakaguncelle(Urun(
                                    id: id,
                                    urunfiyat: urunfiyat + 1,
                                    urunisim: urunisim));
                                setState(() {});
                              },
                              onTap: () async {
                                var veri = await dh1.plakaverigetir(
                                    snapshot.data![index]!["urunisim"]);
                                print(veri![0]);
                                String id = veri[0]["id"].toString();
                                String urunisim =
                                    veri[0]["urunisim"].toString();
                                int urunfiyat =
                                    int.parse(veri[0]["urunfiyat"].toString());
                                dh1.plakaguncelle(Urun(
                                    id: id,
                                    urunfiyat: urunfiyat - 1,
                                    urunisim: urunisim));
                                setState(() {});
                              },
                              title: Text(snapshot.data![index]!["urunisim"]
                                  .toString()),
                              trailing: Text("Kalan Miktar: " +
                                  snapshot.data![index]!["urunfiyat"]
                                      .toString()),
                            )
                          ],
                        );
                      });
                }
                return Text("ilginç");
              },
            ),
          ),
          
        ],
      ),
    );
  }
}
