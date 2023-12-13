part of 'widgets.dart';

class CustomImageNetwork extends StatelessWidget {
  const CustomImageNetwork({
    required this.imageUrl,
    super.key,
    this.alignment = Alignment.center,
    this.boxFit,
    this.height,
    this.width,
    this.color,
    this.blendMode,
  });

  final String imageUrl;
  final Alignment alignment;
  final BoxFit? boxFit;
  final double? height;
  final double? width;
  final Color? color;
  final BlendMode? blendMode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return CachedNetworkImage(
      imageUrl: 'https://${imageUrl.replaceAll('//cdn', 'cdn')}',
      alignment: alignment,
      fit: boxFit,
      height: height,
      width: width,
      color: color,
      colorBlendMode: blendMode,
      placeholder: (context, url) {
        return SpinKitFadingCircle(
          color: theme.colorScheme.onPrimary,
          size: 32,
        );
      },
      errorWidget: (_, url, error) {
        return const SizedBox.shrink();
      },
      errorListener: (value) {
        log('Error network image $value');
      },
    );
  }
}
