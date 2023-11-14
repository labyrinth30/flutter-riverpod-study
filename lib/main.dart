import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/screen/home_screen.dart';

void main() {
  // ProviderScope는 프로바이더를 사용하기 위한 최상위 위젯
  runApp(const ProviderScope(
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
