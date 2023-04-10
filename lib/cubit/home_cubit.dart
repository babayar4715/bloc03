import 'package:bloc_03/service/home_service.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/user_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.service) : super(const HomeState());

  final HomeService service;

  Future<void> getUsers() async {
    emit(const HomeState(status: FetchStatus.loading));
    final users = await service.getUsers();
    if (users != null) {
      emit(HomeState(status: FetchStatus.success, users: users));
    } else {
      emit(const HomeState(status: FetchStatus.error));
    }
  }
}
