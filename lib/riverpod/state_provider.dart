import 'package:flutter_riverpod/flutter_riverpod.dart';

// 숫자 상태관리
// StateProvider의 파라미터에는 함수가 하나 들어감
// 우리가 관리하고자 하는 값을 반환해주면 됨
// 제네릭에는 관리할 값의 타입을 넣어줌
final numberProvider = StateProvider<int>((ref) => 0);
