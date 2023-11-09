import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod_study/layout/default_layout.dart';

// StatelessWidget말고 ConsumerWidget을 사용
class StateProviderScreen extends ConsumerWidget {
  const StateProviderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const DefaultLayout(
      title: 'state_provider_screen',
      body: Column(
        children: [],
      ),
    );
  }
}
