import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';
import 'package:flutter_riverpod_study/riverpod/listen_provider.dart';

// StatelessWidget을 Provider로 사용하려면 ConsumerWidget을 사용해야 한다.
// StatefulWidget을 Provider로 사용하려면 ConsumerStatefulWidget을 사용해야 한다.
class ListenProviderScreen extends ConsumerStatefulWidget {
  const ListenProviderScreen({super.key});

  @override
  ConsumerState<ListenProviderScreen> createState() =>
      _ListenProviderScreenState();
}

// State를 ConsumerState로 바꾼다.
class _ListenProviderScreenState extends ConsumerState<ListenProviderScreen>
    with TickerProviderStateMixin {
  late final TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(
      length: 10,
      vsync: this,
      initialIndex: ref.read(listenProvider),
    );
  }

  // context도 statful하게 글로벌하게 제공이 됨
  @override
  Widget build(BuildContext context) {
    // previous: 원래 값, next: 다음 값
    // 제네릭은 어떤 타입이 반환되는 지
    // listen을 하면 provider 값이 변경될 때마다 이 함수를 실행함
    // 관리하고 있는 index 값에 따라 페이지가 변경됨
    // dispose할 필요 없음
    ref.listen<int>(listenProvider, (previous, next) {
      if (previous != next) {
        controller.animateTo(next);
      }
    });
    return DefaultLayout(
      title: "ListenProviderScreen",
      body: TabBarView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller,
        children: List.generate(
          10,
          (index) => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                index.toString(),
              ),
              ElevatedButton(
                // 마지막 페이지면 10, 아닐 시 현재 state + 1
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 10 ? 10 : state + 1);
                },
                child: const Text("다음으로 버튼"),
              ),
              ElevatedButton(
                onPressed: () {
                  ref
                      .read(listenProvider.notifier)
                      .update((state) => state == 0 ? 0 : state - 1);
                },
                child: const Text("이전으로 버튼"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
