import 'package:flutter/material.dart';
import 'package:flutter_box_transform/flutter_box_transform.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:product_search/core/utils/consts/app_colors.dart';
import 'package:product_search/view/utils/products_search_page_consts.dart';
import 'package:styled_divider/styled_divider.dart';

class ImageCropperWrapper extends ConsumerStatefulWidget {
  const ImageCropperWrapper({
    required this.child,
    required this.onChanged,
    super.key,
  });
  final Widget child;
  final void Function(Rect rect, Offset position) onChanged;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ImageCropperWrapperState();
}

class _ImageCropperWrapperState extends ConsumerState<ImageCropperWrapper> {
  late Rect rect = ProductsSearchPageConsts.defaultImageClip(context);

  void onRectChanged(
    TransformResult<Rect, Offset, Size> result,
    DragUpdateDetails details,
  ) {
    rect = result.rect;
    widget.onChanged(result.rect, result.position);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned.fill(child: widget.child),
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
          cornerHandleBuilder: (context, handle) => Container(
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
          ),
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
