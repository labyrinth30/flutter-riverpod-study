import 'dart:core';

import 'package:flutter/widgets.dart';
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

// AutoDispose 키워드가 자동으로 생성됨
@riverpod
Future<int> gStateFuture(GStateFutureRef ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return 10;
}

@Riverpod(
  // autoDispose가 호출되지 않음
  keepAlive: true,
)
Future<int> gStateFuture2(GStateFuture2Ref ref) async {
  await Future.delayed(const Duration(seconds: 3));
  return 10;
}

// 2) 파라미터를 일반 함수처럼 사용할 수 있도록
// 기존 방식
class Parameter {
  final int number1;
  final int number2;

  Parameter({
    required this.number1,
    required this.number2,
  });
}

final testFamilyProvider = Provider.family<int, Parameter>((ref, parameter) {
  return parameter.number1 * parameter.number2;
});

// Code Generation 방식
@riverpod
int gStateMultiply(
  GStateMultiplyRef ref, {
  required int number1,
  required int number2,
}) {
  return number1 * number2;
}
