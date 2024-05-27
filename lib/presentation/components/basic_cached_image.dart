part of 'components.dart';

class BasicCachedImage extends StatelessWidget {
  final String imageUrl;
  final BoxFit fit;
  final double? height;
  final double? width;
  final double? borderRadius;
  final Color? color;
  const BasicCachedImage({
    super.key,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.height,
    this.width,
    this.borderRadius,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: width,
        height: height,
        child: LayoutBuilder(
          builder: (context, constraints) {
            final size = min(constraints.maxHeight, constraints.maxWidth);
            return ClipRRect(
              borderRadius: BorderRadius.circular(borderRadius ?? 0),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                fit: fit,
                color: color,
                errorWidget: (context, url, error) {
                  return Container(
                    decoration: const BoxDecoration(color: Colors.grey),
                    child: Center(
                      child: Icon(
                        Icons.broken_image,
                        size: size * 0.35,
                        color: Colors.white,
                      ),
                    ),
                  );
                },
                placeholder: (context, url) {
                  if (width != null && height != null) {
                    return BasicShimmer.size(
                      width: width!,
                      height: height!,
                      borderRadius: borderRadius != null ? BorderRadius.circular(borderRadius ?? 8) : null,
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            );
          },
        ));
  }
}
