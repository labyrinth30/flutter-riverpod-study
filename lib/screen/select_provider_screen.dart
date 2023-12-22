import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';
import 'package:flutter_riverpod_study/riverpod/select_provider.dart';

class SelectProviderScreen extends ConsumerWidget {
  const SelectProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 토글버튼 누르면 build가 다시 실행됨
    print('build'); 
    // 만약 isSpicy가 변경되었을 때만 렌더링하고싶다면
    // value는 selectProvider의 상태
    final state = ref.watch(
      // state는 bool값이 되었음
      selectProvider.select((value) => value.isSpicy),
    );
    // hasBought가 변경되었을 때만 값이 변경되게 함
    ref.listen(
        selectProvider.select(
          (value) => value.hasBought,
        ), (previous, next) {
      print('next: $next');
    });
    return DefaultLayout(
      title: "SelectProviderScreen",
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // hasBought를 눌러도 build가 실행 안 됨
            Text(
              state.toString(),
            ),
            // Text(
            //   state.name,
            // ),
            // Text(
            //   state.isSpicy.toString(),
            // ),
            // Text(
            //   state.hasBought.toString(),
            // ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleIsSpicy();
              },
              child: const Text('Spicy Toggle'),
            ),
            ElevatedButton(
              onPressed: () {
                ref.read(selectProvider.notifier).toggleHasBought();
              },
              child: const Text('HasBought Toggle'),
            ),
          ],
        ),
      ),
    );
  }
}
