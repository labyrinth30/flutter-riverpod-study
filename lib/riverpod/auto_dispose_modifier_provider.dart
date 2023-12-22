// ignore_for_file: non_constant_identifier_names

import 'package:flutter_riverpod/flutter_riverpod.dart';

// autoDispose는 프로바이더를 사용하고 나서 자동으로 dispose를 해줌
final AutoDisposeModifierProvider =
    FutureProvider.autoDispose<List<int>>((ref) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );

  return [1, 2, 3, 4, 5];
});
