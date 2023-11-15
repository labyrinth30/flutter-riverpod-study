import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';
import 'package:flutter_riverpod_study/riverpod/stream_provider.dart';

class StreamProviderScreen extends ConsumerWidget {
  const StreamProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch를 통해 multipleStreamProvider를 감시하고 있다가 값이 바뀌면 다시 빌드하게 함
    final state = ref.watch(multipleStreamProvider);
    return DefaultLayout(
      title: "StreamProviderScreen",
      body: Center(
        child: state.when(
            // 상황별로 다른 위젯을 보여줌
            data: ((data) => Text(
                  data.toString(),
                )),
            error: (error, trace) => Text(error.toString()),
            loading: () => const CircularProgressIndicator()),
      ),
    );
  }
}
