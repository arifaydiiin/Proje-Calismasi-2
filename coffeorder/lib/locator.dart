import 'package:coffeorder/data/siparisRepository.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.asNewInstance();

void setup() {
  getIt.registerSingleton<SiparisRepository>(SiparisRepository());
}