import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:product_search/core/utils/consts/app_fonts.dart';
import 'package:product_search/core/widgets/loading_widget.dart';
import 'package:product_search/core/widgets/main_app_bar.dart';
import 'package:product_search/models/search_input/search_input.dart';
import 'package:product_search/resources/resources.dart';
import 'package:product_search/view/components/gallery_button.dart';
import 'package:product_search/view/components/gallery_widget.dart';
import 'package:product_search/view/products_search_page.dart';
import 'package:product_search/view/provider/save_file_to_temporary_provider.dart';
import 'package:product_search/view/settings_page.dart';

final _galleryShownProvider = StateProvider.autoDispose<bool>((ref) => false);

final _selectedImageProvider = StateProvider.autoDispose<File?>((ref) => null);

class ScannerPage extends ConsumerStatefulWidget {
  const ScannerPage({super.key});
  static void navigate(BuildContext context) => Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute<void>(
          builder: (_) => const ScannerPage(),
        ),
        (_) => false,
      );
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
    ref.listen(_selectedImageProvider, (_, image) {
      if (image == null) return;
      ProductsSearchPage.navigate(context, image: SearchInput.file(image.path));
    });

    final galleryShown = ref.watch(_galleryShownProvider);
    return Scaffold(
      body: (!initialized)
          ? const LoadingWidget()
          : Stack(
              children: [
                _CameraWidget(controller: controller!),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const MainAppBarWidget(transparent: true),
                      Expanded(
                        flex: galleryShown ? 0 : 1,
                        child: Container(),
                      ),
                      // ИНСТРУМЕНТЫ (галерея не видна)
                      AnimatedSize(
                        duration: Durations.medium1,
                        child: AnimatedOpacity(
                          duration: Durations.long1,
                          opacity: galleryShown ? 0 : 1,
                          child: SizedBox(
                            height: galleryShown ? 0 : null,
                            child: Column(
                              children: [
                                Image.asset(AppImages.focus),
                                const Gap(33),
                                const _TipWidget(),
                                const Gap(24),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 44,
                                  ),
                                  child: _FooterWidget(controller: controller!),
                                ),
                                const Gap(24),
                              ],
                            ),
                          ),
                        ),
                      ),

                      // ГАЛЕРЕЯ
                      Expanded(
                        flex: galleryShown ? 1 : 0,
                        child: AnimatedSize(
                          duration: Durations.medium1,
                          child: AnimatedOpacity(
                            duration: Durations.medium1,
                            opacity: galleryShown ? 1 : 0,
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                final avaliableHeight = constraints.maxHeight;
                                return SizedBox(
                                  height: galleryShown ? avaliableHeight : 0,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Spacer(),
                                      const _CameraButton(),
                                      const Gap(14),
                                      const _UseCameraText(),
                                      const Spacer(flex: 2),
                                      SizedBox(
                                        height: galleryShown
                                            ? avaliableHeight * .66
                                            : 0,
                                        child: GalleryWidget(
                                          onImageSelected: (image) async {
                                            final file = await ref.read(
                                              saveFileToTemporaryProvider(
                                                image,
                                              ).future,
                                            );
                                            ref
                                                .read(
                                                  _selectedImageProvider
                                                      .notifier,
                                                )
                                                .state = file;
                                          },
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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
    return SafeArea(
      top: false,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GalleryButton(
            onTap: () => ref
                .read(_galleryShownProvider.notifier)
                .update((state) => !state),
          ),
          _SearchButton(controller: controller),
          const _SettingsButton(),
        ],
      ),
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
        onTap: () async {
          final xFile = await controller.takePicture();
          final image = File(xFile.path);
          ref
              .read(
                _selectedImageProvider.notifier,
              )
              .state = image;
        },
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
        onTap: () => SettingsPage.navigate(context),
        child: Image.asset(AppImages.settings),
      ),
    );
  }
}

class _CameraButton extends ConsumerWidget {
  const _CameraButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () =>
          ref.read(_galleryShownProvider.notifier).update((state) => false),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: const Color(0xFF0A2738).withOpacity(.5),
        ),
        width: 73,
        height: 73,
        child: const Icon(
          Icons.camera_alt,
          color: Color(0xFFFACB7E),
        ),
      ),
    );
  }
}

class _UseCameraText extends ConsumerWidget {
  const _UseCameraText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Text(
      'Use camera to search',
      style: AppFonts.extraBold16.copyWith(color: Colors.white),
    );
  }
}
