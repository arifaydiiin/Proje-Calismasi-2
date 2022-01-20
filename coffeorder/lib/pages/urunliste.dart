import 'package:flutter/material.dart';

class UrunListesiGorunumu extends StatefulWidget {
    final String urunyol;
  final String urunisim;
  final String urunfiyat;
 UrunListesiGorunumu({
    Key? key,
    required this.urunyol,
    required this.urunisim,
    required this.urunfiyat,
  }) : super(key: key);
  
  @override
  _UrunListesiGorunumuState createState() => _UrunListesiGorunumuState();
}

class _UrunListesiGorunumuState extends State<UrunListesiGorunumu> {
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18.0),
      child: ListTile(
        leading: Container(
          width: 85,
          height: 85,
          child: Image.asset(
            widget.urunyol,
            fit: BoxFit.fill,
          ),
        ),
        title: Text(widget.urunisim),
        subtitle: Text(widget.urunfiyat + "TL"),
        trailing: Wrap(
          spacing: 5, // space between two icons
          children: <Widget>[
        
            
          ],
        ),
      ),
    );
  }
}