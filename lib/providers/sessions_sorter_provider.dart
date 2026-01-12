import 'package:art_studio_app/objects/sessions_sorter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final sessionsSorterProvider = Provider.autoDispose<ISessionsSorter>((ref) {
  return SessionsSorter();
});
