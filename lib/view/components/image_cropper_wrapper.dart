import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image/image.dart' as img;
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/core/utils/image_source/image_source.dart';
import 'package:product_search/core/widgets/image_source_file.dart';
import 'package:product_search/data/image_transformer.dart';
import 'package:product_search/view/utils/products_search_page_consts.dart';
import 'package:styled_divider/styled_divider.dart';

class ImageCropperWrapper extends ConsumerStatefulWidget {
  const ImageCropperWrapper({
    required this.image,
    required this.onImageResize,
    super.key,
  });
  final ImageSource image;

  final void Function(Future<File> croppedImage) onImageResize;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImageCropperWrapperState();
}

class _ImageCropperWrapperState extends ConsumerState<ImageCropperWrapper> {
  late Rect rect = ProductsSearchPageConsts.defaultImageClip(context);
  late TransformResult<Rect, Offset, Size> _result;
  final GlobalKey _childKey = GlobalKey();

  Timer? _debounce;

  void onRectChanged(
    TransformResult<Rect, Offset, Size> result,
    DragUpdateDetails details,
  ) {
    rect = result.rect;

    _result = result;
    setState(() {});
  }

  Future<String> getImageFile() async {
    return switch (widget.image) {
      FileImageSource(path: final path) => path,
      NetworkImageSource() => throw UnimplementedError(),
      AssetImageSource() => throw UnimplementedError(),
    };
  }

  void onResultChanged() {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 1500), () async {
      final childBox =
          _childKey.currentContext?.findRenderObject() as RenderBox?;
      if (childBox == null) return;

      final file = await getImageFile();

      // Нужно рассчитать масштабные коэфициенты между экраном и изображением.
      // На телефоне картинка отображается, например, в масштабе 300 х 600,
      // Хотя реальный размер картинки 600 x 1200.
      // Поэтому может быть неверный расчет.
      // Рассчитывается как отношение реальной
      final image = await img.decodeImageFile(file);
      if (image == null) return;
      // Определяем соотношения сторон
      final imageAspectRatio = image.width / image.height;
      final boxAspectRatio = childBox.size.width / childBox.size.height;

      // Коэффициенты масштабирования
      double scaleX;
      double scaleY;
      var dx = 0.0;
      var dy = 0.0;

      if (imageAspectRatio > boxAspectRatio) {
        // Если изображение шире контейнера, то масштабируется по высоте
        scaleY = image.height / childBox.size.height;
        scaleX = scaleY;
        dx = (image.width - childBox.size.width * scaleX) / 2;
      } else {
        // Если контейнер шире изображения, то масштабируется по ширине
        scaleX = image.width / childBox.size.width;
        scaleY = scaleX;
        dy = (image.height - childBox.size.height * scaleY) / 2;
      }

      // Масштабируем позицию и размеры
      final scalePosition = _result.position.scale(scaleX, scaleY);
      final scaleRect = Rect.fromCenter(
        center: Offset(scalePosition.dx + dx, scalePosition.dy + dy),
        width: rect.width * scaleX,
        height: rect.height * scaleY,
      );

      widget.onImageResize(cropFile(file, scaleRect));
    });
  }

  Future<File> cropFile(String inputFile, Rect rect) async {
    final cropped = await ImageTransformer().convertImage(
      inputFile,
      cropRect: rect,
    );
    return cropped;
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(
          key: _childKey,
          child: ImageSourceWidget(
            source: widget.image,
            fit: BoxFit.cover,
          ),
        ),
        Positioned.fill(
          child: CustomPaint(
            painter: _CustomPainter(rect),
          ),
        ),
        TransformableBox(
          rect: rect,
          sideHandleBuilder: (context, handle) {
            return !handle.influencesVertical
                ? const StyledVerticalDivider(
                    color: Color(0xFFFACB7E),
                    thickness: 4,
                    lineStyle: DividerLineStyle.dashed,
                  )
                : const StyledDivider(
                    color: Color(0xFFFACB7E),
                    thickness: 4,
                    lineStyle: DividerLineStyle.dashed,
                  );
          },
          onDragEnd: (event) => onResultChanged(),
          onResizeEnd: (_, __) => onResultChanged(),
          cornerHandleBuilder: (context, handle) {
            return Container(
              height: 16,
              width: 16,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFFACB7E),
                    Color(0xFFF79C9C),
                  ],
                ),
              ),
            );
          },
          onChanged: onRectChanged,
          contentBuilder: (_, rect, flip) {
            return Transform.scale(
              scaleX: flip.isHorizontal ? -1 : 1,
              scaleY: flip.isVertical ? -1 : 1,
              child: SizedBox(
                width: rect.width,
                height: rect.height,
              ),
            );
          },
        ),
      ],
    );
  }
}

class _CustomPainter extends CustomPainter {
  _CustomPainter(this.rect);
  final Rect rect;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..color = AppColors.mainBlack.withOpacity(.2);

    // Полный экранный путь
    final screenPath = Path()
      ..addRect(Rect.fromLTWH(0, 0, size.width, size.height));

    final boxPath = Path()..addRect(rect);

    final combinedPath =
        Path.combine(PathOperation.difference, screenPath, boxPath);

    canvas.drawPath(combinedPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
