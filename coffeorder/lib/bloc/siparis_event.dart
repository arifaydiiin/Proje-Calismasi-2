part of 'siparis_bloc.dart';

abstract class SiparisEvent extends Equatable {
   SiparisEvent();

}
class FetchSiparis extends SiparisEvent{
  @override
  List<Object?> get props => [];
}