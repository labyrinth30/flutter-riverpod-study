import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/screen/home_screen.dart';

void main() {
  runApp(const ProviderScope(
    child: MaterialApp(
      home: HomeScreen(),
    ),
  ));
}
