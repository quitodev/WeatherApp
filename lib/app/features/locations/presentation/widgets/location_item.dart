part of 'widgets.dart';

class LocationItem extends StatelessWidget {
  const LocationItem({
    required this.location,
    super.key,
  });

  final Location location;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ColoredBox(
      color: theme.colorScheme.onSurface.withOpacity(0.2),
      child: GestureDetector(
        onTap: () {
          context.read<LocationsCubit>().selectLocation(location.name);
        },
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Row(
            children: [
              const SizedBox(
                width: 8,
              ),
              Icon(
                Icons.pin_drop_rounded,
                size: 18,
                color: theme.colorScheme.onPrimary,
              ),
              const SizedBox(
                width: 16,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomText(
                      text: location.name,
                      color: theme.colorScheme.onPrimary,
                      fontSize: 18.spMax,
                      overflow: TextOverflow.ellipsis,
                    ),
                    CustomText(
                      text: '${location.region}, ${location.country}',
                      color: theme.colorScheme.onPrimary,
                      fontSize: 15.spMax,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
