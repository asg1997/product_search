import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/core/widgets/loading_widget.dart';
import 'package:product_search/core/widgets/main_app_bar.dart';
import 'package:product_search/resources/resources.dart';
import 'package:product_search/view/components/gallery_button.dart';

class ScannerPage extends ConsumerStatefulWidget {
  const ScannerPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ScannerPageState();
}

class _ScannerPageState extends ConsumerState<ScannerPage> {
  CameraController? controller;
  bool get initialized => controller?.value.isInitialized ?? false;

  @override
  void initState() {
    super.initState();
    initCamera();
  }

  Future<void> initCamera() async {
    final cameras = await availableCameras();
    controller = CameraController(cameras.first, ResolutionPreset.max);
    await controller?.initialize();
    if (!mounted) return;
    setState(() {});
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        child: Column(
          children: [
            Expanded(
              child: (!initialized)
                  ? const LoadingWidget()
                  : Stack(
                      children: [
                        _CameraWidget(controller: controller!),
                        const MainAppBarWidget(transparent: true),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Image.asset(AppImages.focus),
                            const Gap(33),
                            const _TipWidget(),
                            const Gap(24),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 44),
                              child: _FooterWidget(controller: controller!),
                            ),
                            const Gap(24),
                          ],
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CameraWidget extends StatelessWidget {
  const _CameraWidget({required this.controller});
  final CameraController controller;
  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      alignment: Alignment.topCenter,
      scale: 1 /
          (controller.value.aspectRatio *
              MediaQuery.of(context).size.aspectRatio),
      child: CameraPreview(controller),
    );
  }
}

class _TipWidget extends ConsumerWidget {
  const _TipWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      width: 193,
      padding: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: const Color(0xFF0A2738).withOpacity(.5),
      ),
      child: Text(
        'To search, press\nthe shooting button',
        textAlign: TextAlign.center,
        style: AppFonts.medium16.copyWith(color: Colors.white),
      ),
    );
  }
}

class _FooterWidget extends ConsumerWidget {
  const _FooterWidget({required this.controller});
  final CameraController controller;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const GalleryButton(),
        _SearchButton(controller: controller),
        const _SettingsButton(),
      ],
    );
  }
}

class _SearchButton extends ConsumerWidget {
  const _SearchButton({required this.controller});
  final CameraController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Image.asset(AppImages.photo),
      ),
    );
  }
}

class _SettingsButton extends ConsumerWidget {
  const _SettingsButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Material(
      shape: const CircleBorder(),
      clipBehavior: Clip.hardEdge,
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Image.asset(AppImages.settings),
      ),
    );
  }
}
