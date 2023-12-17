import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';
import 'package:flutter_riverpod_study/riverpod/future_provider.dart';

class FutureProviderScreen extends ConsumerWidget {
  const FutureProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // provider에서 반환되는 값, 즉 [1,2,3,4,5] 임
    // state는 AsyncValue라는 상태로 들어오게 됨. when이라는 함수가 있음
    final AsyncValue state = ref.watch(multipleFutureProvider);
    return DefaultLayout(
      title: 'FutureProviderScreen',
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // state.when과 map이 있음
          // state.when은 AsyncValue의 상태에 따라서 다른 위젯을 반환
          // data는 로딩이 끝나고 데이터가 있을 때
          // error는 에러가 발생했을 때
          // loading은 로딩 중일 때
          state.when(
            data: (data) {
              return Text(
                data.toString(),
                textAlign: TextAlign.center,
              );
            },
            error: (error, stackTrace) {
              return Text(
                error.toString(),
                textAlign: TextAlign.center,
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        ],
      ),
    );
  }
}
