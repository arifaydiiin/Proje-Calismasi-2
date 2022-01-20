import 'package:coffeorder/bloc/siparis_bloc.dart';
import 'package:coffeorder/data/siparisRepository.dart';
import 'package:coffeorder/locator.dart';
import 'package:coffeorder/models/siparis.dart';
import 'package:coffeorder/widgets/SalonNo.dart';
import 'package:flutter/material.dart';

class MainHall extends StatefulWidget {
  List<Siparis?>? siparisler;
  MainHall({Key? key,required this.siparisler}) : super(key: key);

  @override
  _MainHallState createState() => _MainHallState();
}

class _MainHallState extends State<MainHall> {
    final SiparisRepository siparisRepository = getIt<SiparisRepository>();
  @override
  Widget build(BuildContext context) {
    print(widget.siparisler![0]!.yemekler.toString());
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
                  SalonButton(salonno: "1",kisino: "4",siparisvarmi: widget.siparisler![0]!.yemekler!.length!=0 ? true: false ,siparisler: widget.siparisler,),
                  SalonButton(salonno: "2",kisino: "2",siparisvarmi: widget.siparisler![1]!.yemekler!.length!=0 ? true : false ,siparisler: widget.siparisler),
                  SalonButton(salonno: "3",kisino: "3",siparisvarmi: widget.siparisler![2]!.yemekler!.length!=0 ? true : false ,siparisler: widget.siparisler),
                  SalonButton(salonno:"4",kisino: "4",siparisvarmi: widget.siparisler![3]!.yemekler!.length!=0 ? true : false,siparisler: widget.siparisler ),
                  SalonButton(salonno: "5",kisino: "2",siparisvarmi: widget.siparisler![4]!.yemekler!.length!=0 ? true : false ,siparisler: widget.siparisler),
                  SalonButton(salonno: "6",kisino: "1",siparisvarmi: widget.siparisler![5]!.yemekler!.length!=0 ? true : false ,siparisler: widget.siparisler),
                  SalonButton(salonno:"7",kisino: "2",siparisvarmi: widget.siparisler![6]!.yemekler!.length!=0 ? true : false,siparisler: widget.siparisler ),
                  SalonButton(salonno: "8",kisino: "3",siparisvarmi: widget.siparisler![7]!.yemekler!.length!=0 ? true : false,siparisler: widget.siparisler ),
                  SalonButton(salonno: "9",kisino: "4",siparisvarmi: widget.siparisler![8]!.yemekler!.length!=0 ? true : false,siparisler: widget.siparisler ),
                  SalonButton(salonno:"10",kisino: "3",siparisvarmi: widget.siparisler![9]!.yemekler!.length!=0 ? true : false ,siparisler: widget.siparisler),
                  SalonButton(salonno: "11",kisino: "2",siparisvarmi: widget.siparisler![10]!.yemekler!.length!=0 ? true : false,siparisler: widget.siparisler ),
                  SalonButton(salonno: "12",kisino: "4",siparisvarmi: widget.siparisler![11]!.yemekler!.length!=0 ? true : false,siparisler: widget.siparisler ),
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
