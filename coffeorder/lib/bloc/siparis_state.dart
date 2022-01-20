part of 'siparis_bloc.dart';
abstract class SiparisState extends Equatable {
  SiparisState();
  
  @override
  List<Object> get props => [];
}

class SiparisInitial extends SiparisState {}
class SiparisWaitingState extends SiparisState{}
class SiparisLoadedState extends SiparisState{
  
     List<Siparis?>? siparis;
    SiparisLoadedState({required this.siparis});
  
  @override
  List<Object> get props => [siparis!];
}
class SiparisErrorState extends SiparisState{}