import 'package:coffeorder/data/siparisApiClient.dart';
import 'package:coffeorder/models/siparis.dart';

class SiparisRepository{
  final SiparisApiClient siparisApiClient = SiparisApiClient();
 Future <List<Siparis?>?> repotumsiparislerigetir()async{
   print("repoya girildi");
   List<Siparis?>? list = await siparisApiClient.tumsiparislerigetir();
   return list;
  }
}