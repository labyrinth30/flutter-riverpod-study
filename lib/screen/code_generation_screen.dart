import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';
import 'package:flutter_riverpod_study/riverpod/code_generation_provider.dart';

class CodeGenerationScreen extends ConsumerWidget {
  const CodeGenerationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state1 = ref.watch(gStateProvider);
    final state2 = ref.watch(gStateFutureProvider);
    final state3 = ref.watch(gStateFuture2Provider);
    final state4 = ref.watch(
      gStateMultiplyProvider(
        number1: 10,
        number2: 20,
      ),
    );
    // build가 호출되는 대상이 전체 위젯이라는 문제가 있음
    print('build');
    return DefaultLayout(
      title: 'CodeGenerationScreen',
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text('State1: $state1'),
          state2.when(
            data: (data) {
              return Text(
                'State2: ${data.toString()}',
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
          state3.when(
            data: (data) {
              return Text(
                'State3: ${data.toString()}',
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
          Text('State4: $state4'),
          // Consumer 위젯으로 state를 감싸면 해당 state가 변경될 때만 build가 호출됨
          Consumer(
            builder: (context, ref, child) {
              print('builder build');
              final state5 = ref.watch(gStateNotifierProvider);
              return Row(
                children: [
                  Text('State5: $state5'),
                  // null safety를 위해 !를 붙여줌
                  child!,
                ],
              );
            },
            // child로 입력된 위젯이 Counsumer의 builder의 child로 들어감
            // 새로 렌더링하는 요소가 부분적일 때 최적화를 위해 사용
            // 성능 최적화를 위해 사용
            child: const Text('hello'),
          ),
          Row(
            children: [
              // ref.read는 일시적 업데이트 등을 위해 사용함.
              // 해당 프로바이더를 읽어올 수 있음
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).increment();
                },
                child: const Text('Increment'),
              ),
              ElevatedButton(
                onPressed: () {
                  ref.read(gStateNotifierProvider.notifier).decrement();
                },
                child: const Text('Decrement'),
              ),
            ],
          ),
          // invalidate()
          // state를 유효하지 않게 하여 초기화하는 방법
          ElevatedButton(
            onPressed: () {
              ref.invalidate(gStateNotifierProvider);
            },
            child: const Text(
              'Invalidate',
            ),
          ),
        ],
      ),
    );
  }
}

// 따로 하위 위젯을 만들면 국소적으로 build가 호출됨
// 그러나 비효율적임
class _StateFiveWidget extends ConsumerWidget {
  const _StateFiveWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state5 = ref.watch(gStateNotifierProvider);
    return Text('State5: $state5');
  }
}
