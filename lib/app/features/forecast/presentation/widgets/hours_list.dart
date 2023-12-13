part of 'widgets.dart';

class HoursList extends StatelessWidget {
  const HoursList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<ForecastCubit, Day>(
        builder: (context, state) {
          return ListView.separated(
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemCount: state.hours.length,
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 8,
              );
            },
            itemBuilder: (context, index) {
              return HourItem(
                hour: state.hours[index],
              );
            },
          );
        },
      ),
    );
  }
}
