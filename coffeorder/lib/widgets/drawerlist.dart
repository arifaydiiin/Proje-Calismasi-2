import 'package:coffeorder/pages/drawermenu.dart';
import 'package:coffeorder/pages/stockpage.dart';
import 'package:flutter/material.dart';


class DrawerListItem extends StatelessWidget {
  const DrawerListItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 60,
        ),
        Text(
          "Coffe Order",
          style: TextStyle(fontSize: 23),
        ),
        Container(
          child: Divider(
            thickness: 1,
            height: 0,
            color: Colors.black,
            indent: 5,
            endIndent: 5,
          ),
        ),
        
        ListTile(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>DrawerMenu()));
          },
          title: Text("Güncel Menü"),
        ),
        Divider(
          thickness: 1,
          height: 0,
          color: Colors.black,
          indent: 5,
          endIndent: 5,
        ),
        ListTile(
          title: Text("Stok Durumu "),
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>StockPage()));
          },
        ),
        Divider(
          thickness: 1,
          height: 0,
          color: Colors.black,
          indent: 5,
          endIndent: 5,
        ),
      ],
    );
  }
}
