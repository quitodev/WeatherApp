part of 'widgets.dart';

class CustomProgress extends StatelessWidget {
  const CustomProgress({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: Stack(
        children: [
          SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: const CustomImageAsset(
              imageUrl: AppImages.background,
              boxFit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: ColoredBox(
              color: Colors.black.withOpacity(0.5),
            ),
          ),
          Center(
            child: SpinKitFadingCircle(
              color: theme.colorScheme.onPrimary,
              size: 32,
            ),
          ),
        ],
      ),
    );
  }
}
