import 'package:art_studio_app/objects/date_formater.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateFormaterProvider = Provider.autoDispose<IDateFormater>((ref) {
  return DateFormater();
});
