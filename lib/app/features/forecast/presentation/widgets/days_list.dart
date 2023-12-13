part of 'widgets.dart';

class DaysList extends StatelessWidget {
  const DaysList({
    required this.days,
    super.key,
  });

  final List<Day> days;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 152,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemCount: days.length,
        separatorBuilder: (context, index) {
          return const SizedBox(
            width: 8,
          );
        },
        itemBuilder: (context, index) {
          return DayItem(
            day: days[index],
          );
        },
      ),
    );
  }
}
