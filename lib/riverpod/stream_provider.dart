import 'package:flutter_riverpod/flutter_riverpod.dart';

final multipleStreamProvider = StreamProvider<List<int>>((ref) async* {
  for (int i = 0; i < 10; i++) {
    // 1초마다
    await Future.delayed(
      const Duration(
        seconds: 1,
      ),
    );
    // 3개의 숫자를 i랑 곱해서 생성
    // yield는 return과 비슷하게 값을 반환하는데
    // 함수가 종료되지 않고 계속 열려있으면 지속적으로 return 값을 반환함
    yield List.generate(3, (index) => index * i);
  }
});
