part of 'widgets.dart';

class HourItem extends StatelessWidget {
  const HourItem({
    required this.hour,
    super.key,
  });

  final Hour hour;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      height: 64,
      color: theme.colorScheme.onSurface.withOpacity(0.2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const SizedBox(
            width: 8,
          ),
          CustomText(
            text: hour.time,
            color: theme.colorScheme.onPrimary,
            fontSize: 18.spMax,
          ),
          const SizedBox(
            width: 8,
          ),
          CustomImageNetwork(
            imageUrl: hour.conditionIcon,
            height: 56,
          ),
          const SizedBox(
            width: 8,
          ),
          CustomText(
            text: hour.tempC,
            color: theme.colorScheme.onPrimary,
            fontSize: 24.spMax,
          ),
          const SizedBox(
            width: 8,
          ),
          CustomText(
            text: 'Feels like ${hour.feelslikeC}',
            color: theme.colorScheme.onPrimary,
            fontSize: 14.spMax,
          ),
          const SizedBox(
            width: 8,
          ),
        ],
      ),
    );
  }
}
