import 'package:flutter_riverpod/flutter_riverpod.dart';

// modifier는 Provider에 점 찍고 추가 가능함
// family는 파라미터를 2개 받음, 입력받은 데이터의 타입, 데이터
// 생성자에 data에 3을 넣었기 때문에 data에 3이 들어가서 3, 6, 9, 12, 15가 출력됨

// Provider를 생성할 때 생성하는 순간에 어떤 변수를 입력해서 변수로 로직을 변경하고 싶으면 사용함
final familyModifierProvider =
    FutureProvider.family<List<int>, int>((ref, data) async {
  await Future.delayed(
    const Duration(seconds: 2),
  );
  return List.generate(5, (index) => index * data);
});
