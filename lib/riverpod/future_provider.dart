// 실제 async 요청을 가정한 상황
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 제네릭에 들어갈 state의 타입과 리턴해주는 값이 다름
final multipleFutureProvider = FutureProvider<List<int>>((ref) async {
  // 2초 뒤 배열 리턴
  await Future.delayed(
    const Duration(
      seconds: 2,
    ),
  );
  // throw Exception('에러 발생');
  return [1, 2, 3, 4, 5];
});
