part of 'widgets.dart';

class LocationsEmpty extends StatelessWidget {
  const LocationsEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CustomImageAsset(
            imageUrl: AppImages.logo,
            width: 150,
          ),
          const SizedBox(
            height: 16,
          ),
          CustomText(
            width: 200,
            text: l10n.searchLocation,
            color: theme.colorScheme.onPrimary,
            fontSize: 18.spMax,
            maxLines: 2,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
