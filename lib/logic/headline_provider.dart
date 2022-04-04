import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:news/data/models/headline_model.dart';
import 'package:news/data/repository.dart';

final headlineProvider = FutureProvider<List<HeadlineModel>>((ref) async {
  return Repository().getHeadline();
});
