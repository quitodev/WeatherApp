part of 'pages.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final opacity = ValueNotifier<double>(0);

    return BlocProvider(
      create: (_) => SplashCubit()..goHome(),
      child: Scaffold(
        backgroundColor: theme.colorScheme.primary,
        body: BlocConsumer<SplashCubit, SplashState>(
          listener: (context, state) {
            if (state.status is SplashSuccess) {
              context.goNamed(Routes.routeLocations.name);
            }
            opacity.value = 1;
          },
          builder: (context, state) {
            return _SplashContent(opacity: opacity.value);
          },
        ),
      ),
    );
  }
}

class _SplashContent extends StatelessWidget {
  const _SplashContent({
    required this.opacity,
  });

  final double opacity;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SizedBox(
          height: 1.sh,
          width: 1.sw,
          child: const CustomImageAsset(
            imageUrl: AppImages.background,
            boxFit: BoxFit.fill,
          ),
        ),
        AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(milliseconds: 1500),
          child: const Center(
            child: CustomImageAnimation(
              image: AppImages.logo,
              width: 150,
            ),
          ),
        ),
      ],
    );
  }
}
