import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/data/models/search_model.dart';
import 'package:news/data/repository.dart';

final searchProvider =
    FutureProvider.family<List<SearchModel>, String>((ref, query) async {
  return Repository().search(query: query);
});
