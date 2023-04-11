import 'dart:developer';

import 'package:http/http.dart' as http;

import '../constants/api_const.dart';
import '../model/user_model.dart';

// class HomeService {
//   const HomeService(this.client);

//   final http.Client client;

//   Future<List<User>?> getUsers() async {
//     try {
//       final uri = Uri.parse(ApiConst.users);
//       final response = await client.get(uri);
//       if (response.statusCode == 200 || response.statusCode == 201) {
//         final data = fromStringList(response.body);
//         return data;
//       } else {
//         log('${response.statusCode}');
//         return null;
//       }
//     } catch (e) {
//       log(e.toString());
//       return null;
//     }
//   }
// }

// final homeService = HomeService(http.Client());

class HomeService {
  const HomeService(this.client);

  final http.Client client;

  Future<List<User>?> getUsers() async {
    try {
      final uri = Uri.parse(ApiConst.users);
      final response = await client.get(uri);
      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = fromStringList(response.body);
        return data;
      } else {
        log('${response.statusCode}');
        return null;
      }
    } catch (e) {
      log(e.toString());
      return null;
    }
  }
}

final homeService = HomeService(http.Client());
