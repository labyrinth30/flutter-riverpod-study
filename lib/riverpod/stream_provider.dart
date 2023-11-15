import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleStreamProvider = StreamProvider<List<int>>((ref) async* {
  for (int i = 0; i < 10; i++) {
    // 1초마다
    await Future.delayed(const Duration(seconds: 1));
    // 3개의 숫자를 i랑 곱해서 생성
    yield List.generate(3, (index) => index * i);
  }
});
