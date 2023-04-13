import 'package:bloc_03/bloc/home_bloc_bloc.dart';
import 'package:bloc_03/cubit/home_cubit.dart';
import 'package:bloc_03/service/home_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/bloc-page.dart';
import '../home/cubit_page.dart';

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       // home: BlocProvider(
//       //   create: (context) => HomeBloc(homeService)..add(FetchEvent()),
//       //   child: const BlocPage(),
//       // ),
//       home: BlocProvider(
//         create: (context) => HomeCubit(homeService)..getUsers(),
//         child: const HomePage(),
//       ),
//     );
//   }
// }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // home: BlocProvider(
      //   create: (context) => HomeCubit(homeService)..getUsers(),
      //   child: const CubitPage(),
      // ),
      home: BlocProvider(
        create: (context) => HomeBloc(homeService)..add(FetchEvent()),
        child: const BlocPage(),
      ),
    );
  }
}
