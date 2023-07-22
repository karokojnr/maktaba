import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'config/config.dart';

void main() {
  final container = ProviderContainer();
  // container.read(stubProvider);
  runApp(
      UncontrolledProviderScope(container: container, child: const MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(goRouter);

    return MaterialApp.router(
      title: 'Pwani Library🚀',
      debugShowCheckedModeBanner: false,
      routerConfig: router,
      theme: getAppTheme(context),
    );
  }
}
