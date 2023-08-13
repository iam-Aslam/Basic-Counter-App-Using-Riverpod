import 'package:counter/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CounterPage extends ConsumerWidget {
  const CounterPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var value = ref.watch(counterStateProvider);
    return Scaffold(
      body: Center(
        child: Text(
          'Value: $value',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FloatingActionButton(
              onPressed: () => ref.read(counterStateProvider.notifier).state--,
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: () => ref.read(counterStateProvider.notifier).state++,
              child: const Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}
