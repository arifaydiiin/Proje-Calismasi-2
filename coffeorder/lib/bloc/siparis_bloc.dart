
import 'package:bloc/bloc.dart';
import 'package:coffeorder/data/siparisRepository.dart';
import 'package:coffeorder/models/siparis.dart';
import 'package:equatable/equatable.dart';


import '../locator.dart';
part 'siparis_event.dart';
part 'siparis_state.dart';

class SiparisBloc extends Bloc<SiparisEvent, SiparisState> {
  
  final SiparisRepository siparisRepository = getIt<SiparisRepository>();
  SiparisBloc() : super(SiparisInitial()){
     on<FetchSiparis>(_onStarted);
  }
  void _onStarted(FetchSiparis event, Emitter<SiparisState> emit) async {
    emit(SiparisWaitingState());
    try {
      print("bloc içinde onstarted çalıştı");
      final getirilensiparis = await siparisRepository.repotumsiparislerigetir();
      emit(SiparisLoadedState(siparis: getirilensiparis));
    } catch (_) {
      emit(SiparisErrorState());
    }
  }
  
  // Stream <SiparisState> mapEventToState(SiparisEvent event)async*{
  //   if(event is FetchSiparis)
  //   {
  //     yield SiparisWaitingState();
  //     try{
  //        final List<Siparis?>? getirilensiparis = await siparisRepository.repotumsiparislerigetir();
  //        yield SiparisLoadedState(siparis: getirilensiparis);
  //     }catch(e){
  //       yield SiparisErrorState();
  //     }
  //   }
  // }

  
}
