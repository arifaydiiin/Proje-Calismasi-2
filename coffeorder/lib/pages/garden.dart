import 'dart:math';

import 'package:coffeorder/data/siparisRepository.dart';
import 'package:coffeorder/locator.dart';
import 'package:coffeorder/models/siparis.dart';
import 'package:coffeorder/pages/tableDetail.dart';
import 'package:coffeorder/widgets/SalonNo.dart';
import 'package:flutter/material.dart';

class Garden extends StatefulWidget {
   List<Siparis?>? siparisler; 
  Garden({Key? key,required this.siparisler}) : super(key: key);

  @override
  _GardenState createState() => _GardenState();
}

 
class _GardenState extends State<Garden> {

    final SiparisRepository siparisRepository = getIt<SiparisRepository>();


  @override
  Widget build(BuildContext context) {
    
    return SingleChildScrollView(
      child: Center(
          child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: RefreshIndicator(
              onRefresh: ()async{
                widget.siparisler = await siparisRepository.repotumsiparislerigetir();
                
               setState(() {
                 
               });
              },
              child: GridView.count(          
                childAspectRatio: (100 / 100),
                primary: false,
                padding: const EdgeInsets.all(20),
                crossAxisSpacing: 10,
                mainAxisSpacing: 20,
                crossAxisCount: 2,
                children: <Widget>[
                  SalonButton(salonno:"13", kisino: "6",siparisvarmi: widget.siparisler![12]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"14", kisino: "8",siparisvarmi: widget.siparisler![13]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"15", kisino: "4",siparisvarmi: widget.siparisler![14]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"16", kisino: "2",siparisvarmi: widget.siparisler![15]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"17", kisino: "2",siparisvarmi: widget.siparisler![16]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"18", kisino: "4",siparisvarmi: widget.siparisler![17]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"19", kisino: "4",siparisvarmi: widget.siparisler![18]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"20", kisino: "6",siparisvarmi: widget.siparisler![19]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"21", kisino: "5",siparisvarmi: widget.siparisler![20]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"22",kisino: "4",siparisvarmi: widget.siparisler![21]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"23",kisino: "2",siparisvarmi: widget.siparisler![22]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"24",kisino: "4",siparisvarmi: widget.siparisler![23]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SizedBox(
                    height: 150,
                  )
                ],
              ),
            ),
          )
        ],
      )),
    );
  }
}
