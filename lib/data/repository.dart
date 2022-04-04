import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/core/config.dart';
import 'package:news/data/api/api_client.dart';
import 'package:news/data/models/headline_model.dart';
import 'package:news/data/models/search_model.dart';

class Repository {
  Future<List<HeadlineModel>> getHeadline() async {
    try {
      final data = await ApiClient().getData(endpoint: Config.topheadline);
      final List result = data['sources'];
      return result.map((e) => HeadlineModel.fromJson(e)).toList();
    } on SocketException catch (error) {
      throw Exception('No Interet Connection : $error');
    } catch (e) {
      throw Exception('Api Error : $e');
    }
  }

  Future<List<SearchModel>> search({required String query}) async {
    final String endpoint =
        'everything?q=$query&pageSize=10&apiKey=fcdc159d8d1641ec92762a83efd95bec';
    try {
      final data = await ApiClient().getData(endpoint: endpoint);
      final List result = data['articles'];
      return result.map((e) => SearchModel.fromJson(e)).toList();
    } on SocketException catch (error) {
      throw Exception('No Interet Connection : $error');
    } catch (e) {
      throw Exception('Api Error : $e');
    }
  }
}

final repositoryProvider = Provider<Repository>((ref) {
  return Repository();
});
