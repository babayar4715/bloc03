import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/home_cubit.dart';
import '../model/user_model.dart';

class CubitPage extends StatelessWidget {
  const CubitPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CubitPage'),
      ),
      body: Center(
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            switch (state.status) {
              case FetchStatus.initial:
                return const Text('initial state');
              case FetchStatus.loading:
                return const CircularProgressIndicator();
              case FetchStatus.success:
                return UserListBuilder(users: state.users!);
              case FetchStatus.error:
                return const Text('error state');
              default:
                return const Text('default state');
            }
          },
        ),
      ),
    );
  }
}

class UserListBuilder extends StatelessWidget {
  const UserListBuilder({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      itemBuilder: (context, index) {
        final user = users[index];
        return Card(
          child: ListTile(
            title: Text(user.name),
            subtitle: Text(user.username),
          ),
        );
      },
    );
  }
}
