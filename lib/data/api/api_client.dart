import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart';
import 'package:news/core/config.dart';

class ApiClient {
  Future getData({required String endpoint}) async {
    final result = await get(Uri.parse(Config.baseUrl + endpoint));
    if (result.statusCode == 200) {
      return jsonDecode(result.body);
    } else {
      throw Exception(result.reasonPhrase);
    }
  }

  // Future<List<HeadlineModel>> getHeadlines() async {
  //   Response response = await get(
  //     Uri.parse(Config.topheadline),
  //   );

  //   if (response.statusCode == 200) {
  //     final List result = jsonDecode(response.body)['sources'];
  //     return result.map((e) => HeadlineModel.fromJson(e)).toList();
  //   } else {
  //     throw Exception(response.reasonPhrase);
  //   }
  // }
}

final apiProvider = Provider<ApiClient>((ref) {
  return ApiClient();
});
