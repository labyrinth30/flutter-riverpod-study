import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';
import 'package:flutter_riverpod_study/riverpod/family_modifier_provider.dart';

class FamilyModifierScreen extends ConsumerWidget {
  const FamilyModifierScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // family를 사용하면 생성을 해줘야함
    // 괄호 안에 데이터값에 해당되는 파라미터를 넣어줘야함
    final state = ref.watch(familyModifierProvider(3));
    return DefaultLayout(
      title: "FamilyModifierScreen",
      body: Center(
        // future니까 when 사용
        child: state.when(
          data: (data) => Text(
            data.toString(),
          ),
          error: (error, stack) => Text(
            error.toString(),
          ),
          loading: () => const CircularProgressIndicator(),
        ),
      ),
    );
  }
}
