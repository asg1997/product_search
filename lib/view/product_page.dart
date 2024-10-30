import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/widgets/main_app_bar.dart';
import 'package:product_search/models/product/product.dart';
import 'package:webview_flutter/webview_flutter.dart';

class ProductPage extends ConsumerStatefulWidget {
  const ProductPage({required this.product, super.key});
  final Product product;

  static void navigate(BuildContext context, {required Product product}) =>
      Navigator.push(
        context,
        MaterialPageRoute<void>(
          builder: (_) => ProductPage(product: product),
        ),
      );

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ProductPageState();
}

class _ProductPageState extends ConsumerState<ProductPage> {
  String get url {
    final id = widget.product.urlId;
    return 'https://productsearch.app/api/to?url=$id';
  }

  late final controller = WebViewController()
    ..setJavaScriptMode(JavaScriptMode.unrestricted)
    ..loadRequest(Uri.parse(url));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBarWidget(),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
