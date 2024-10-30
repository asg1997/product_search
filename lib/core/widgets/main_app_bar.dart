import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/widgets/logo_widget.dart';

class MainAppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const MainAppBarWidget({
    this.transparent = false,
    super.key,
  });

  final bool transparent;
  @override
  Size get preferredSize => const Size(double.infinity, 44);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: transparent ? Colors.transparent : Colors.white,
      centerTitle: true,
      elevation: 0,

      leading: Navigator.of(context).canPop() ? const BackButton() : null,
      // НАЗВАНИЕ
      title: const LogoWidget(),
    );
  }
}
