import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';
import 'package:flutter_riverpod_study/riverpod/auto_dispose_modifier_provider.dart';

class AutoDisposeModifierScreen extends ConsumerWidget {
  const AutoDisposeModifierScreen({super.key});
  // FutureProvider.autoDispose는 프로바이더를 사용하고 나서 자동으로 dispose를 해줌
  // 즉 기존 FutureProvider는 캐싱이 적용되었는데, autoDispose를 사용하면 캐싱이 적용되지 않음
  // 필요가 없을 때 메모리에서 삭제해야하는 경우에 사용
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(AutoDisposeModifierProvider);
    return DefaultLayout(
      title: "AutoDisposeModifierScreen",
      body: Center(
        // FutureProvider이기 때문에 state.when을 사용
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
