import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'code_generation_provider.g.dart';

// 사용하는 이유
// 1) 어떤 프로바이더를 사용할지 결정할 고민 할 필요가 없도록

final _testProvider = Provider<String>((ref) => 'Hello  Code Generation');

@riverpod
String gState(GStateRef ref) {
  return 'Hello  Code Generation';
}

// 2) 파라미터를 일반 함수처럼 사용할 수 있도록

