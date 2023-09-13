import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';
import 'package:flutter_riverpod_study/riverpod/state_provider_screen.dart';

// StatelessWidget말고 ConsumerWidget을 사용
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ref.watch는 특정 프로바이더를 바라보고 있다가 그 프로바이더가 변경이 된다면은 빌드를 다시 실행해라
    final provider = ref.watch(numberProvider);
    return DefaultLayout(
      title: 'state_provider_screen',
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              provider.toString(),
            )
          ],
        ),
      ),
    );
  }
}
