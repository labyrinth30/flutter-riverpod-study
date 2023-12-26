import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/riverpod/provider_observer.dart';
import 'package:flutter_riverpod_study/screen/home_screen.dart';

void main() {
  // ProviderScope는 프로바이더를 사용하기 위한 최상위 위젯
  runApp(
    // Scope 하위에 있는 프로바이더들이 업데이트 되었을 때 로그가 찍힘
    ProviderScope(
      observers: [
        Logger(),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    ),
  );
}
