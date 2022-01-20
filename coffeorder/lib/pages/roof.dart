import 'package:coffeorder/data/siparisRepository.dart';
import 'package:coffeorder/locator.dart';
import 'package:coffeorder/models/siparis.dart';
import 'package:coffeorder/widgets/SalonNo.dart';
import 'package:flutter/material.dart';

class Roof extends StatefulWidget {
  List<Siparis?>? siparisler; 
  Roof({Key? key,this.siparisler}) : super(key: key);

  @override
  _RoofState createState() => _RoofState();
}

class _RoofState extends State<Roof> {
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
                   SalonButton(salonno: "25",kisino: "4",siparisvarmi: widget.siparisler![24]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno: "26",kisino: "2",siparisvarmi: widget.siparisler![25]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno: "27",kisino: "3",siparisvarmi: widget.siparisler![26]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"28",kisino: "4",siparisvarmi: widget.siparisler![27]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno: "29",kisino: "2",siparisvarmi: widget.siparisler![28]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno: "30",kisino: "1",siparisvarmi: widget.siparisler![29]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"31",kisino: "2",siparisvarmi: widget.siparisler![30]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno: "32",kisino: "3",siparisvarmi: widget.siparisler![31]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno: "33",kisino: "4",siparisvarmi: widget.siparisler![32]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno:"34",kisino: "3",siparisvarmi: widget.siparisler![33]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno: "35",kisino: "2",siparisvarmi: widget.siparisler![34]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno: "36",kisino: "4",siparisvarmi: widget.siparisler![35]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
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
