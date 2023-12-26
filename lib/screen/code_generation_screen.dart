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
    final state5 = ref.watch(gStateNotifierProvider);
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
          Text('State5: $state5'),
          Row(
            children: [
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
