import 'package:bloc_03/service/home_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/user_model.dart';
part 'home_bloc_event.dart';
part 'home_bloc_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this.service) : super(HomeInitial()) {
    on<HomeEvent>((_getUsers));
  }

  final HomeService service;

  Future<void> _getUsers(HomeEvent event, Emitter<HomeState> emit) async {
    //  _getUsers  this is a private function it can be work only in this page /
    // either it doesn't
    emit(HomeLoading());
    final users = await service.getUsers();
    if (users != null) {
      emit(HomeSucces(users));
    } else {
      emit(HomeError());
    }
  }
}
