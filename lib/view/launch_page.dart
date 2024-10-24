import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/widgets/loading_widget.dart';
import 'package:product_search/view/controllers/launch_controller.dart';
import 'package:product_search/view/scanner_page.dart';

class LaunchPage extends ConsumerWidget {
  const LaunchPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(launchControllerProvider, (_, isReady) {
      if (isReady) ScannerPage.navigate(context);
    });
    return const Scaffold(body: LoadingWidget());
  }
}
