part of 'widgets.dart';

class DayItem extends StatelessWidget {
  const DayItem({
    required this.day,
    super.key,
  });

  final Day day;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocBuilder<ForecastCubit, Day>(
      builder: (context, state) {
        return Container(
          width: 80,
          color: theme.colorScheme.onSurface.withOpacity(
            state.date == day.date ? 0.5 : 0.2,
          ),
          child: GestureDetector(
            onTap: () {
              context.read<ForecastCubit>().selectDay(day);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  height: 8,
                ),
                CustomText(
                  text: day.date,
                  color: theme.colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 20.spMax,
                  overflow: TextOverflow.ellipsis,
                ),
                CustomImageNetwork(
                  imageUrl: day.conditionIcon,
                  height: 64,
                ),
                CustomText(
                  text: 'Min. ${day.mintempC}',
                  color: theme.colorScheme.onPrimary,
                  fontSize: 16.spMax,
                  overflow: TextOverflow.ellipsis,
                ),
                CustomText(
                  text: 'Max. ${day.maxtempC}',
                  color: theme.colorScheme.onPrimary,
                  fontSize: 16.spMax,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
