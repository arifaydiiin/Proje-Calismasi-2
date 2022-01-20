import 'package:coffeorder/bloc/siparis_bloc.dart';
import 'package:coffeorder/constant.dart';
import 'package:coffeorder/data/databasehelper.dart';
import 'package:coffeorder/data/siparisRepository.dart';
import 'package:coffeorder/locator.dart';
import 'package:coffeorder/models/siparis.dart';
import 'package:coffeorder/models/urun.dart';
import 'package:coffeorder/pages/drawermenu.dart';
import 'package:coffeorder/pages/garden.dart';
import 'package:coffeorder/pages/main_hall.dart';
import 'package:coffeorder/pages/roof.dart';
import 'package:coffeorder/widgets/drawerlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setup();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<SiparisBloc>(
        create: (context) => SiparisBloc()..add(FetchSiparis()),
        child: DefaultTabController(
            length: 3, child: MyHomePage(title: Constants.kafeismi)),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final GlobalKey<ScaffoldState> _keydrawer = GlobalKey();
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
    DatabaseHelper dh1 = DatabaseHelper();
  final SiparisRepository siparisRepository = getIt<SiparisRepository>();
  @override
  Widget build(BuildContext context) {
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
      key: widget._keydrawer,
      drawer: Drawer(
        child: BlocBuilder<SiparisBloc, SiparisState>(
           builder: (context, SiparisState state) {
            if (state is SiparisInitial) {
          return Center(
            child: Text("Yükleniyor..."),
          );
        }
        if (state is SiparisWaitingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SiparisLoadedState) {
          return DrawerListItem();
        } else {
          return Center(
            child: Text("Hata var "),
          );
        }
          },
        ),
      ),
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            Tab(
              text: "Ana Salon",
            ),
            Tab(
              text: "Bahçe",
            ),
            Tab(
              text: "Teras",
            ),
          ],
        ),
        leading: IconButton(
            onPressed: () {
              widget._keydrawer.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.list_rounded,
              size: 37,
            )),
        title: Text(widget.title),
      ),
      body: BlocBuilder<SiparisBloc, SiparisState>(
          builder: (context, SiparisState state) {
        if (state is SiparisInitial) {
          return Center(
            child: Text("Yükleniyor..."),
          );
        }
        if (state is SiparisWaitingState) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SiparisLoadedState) {
          return TabBarView(
            children: [
              MainHall(siparisler: state.siparis),
              Garden(
                siparisler: state.siparis,
              ),
              Roof(siparisler: state.siparis)
            ],
          );
        } else {
          return Center(
            child: Text("Hata var "),
          );
        }
      }),
    );
  }
}
