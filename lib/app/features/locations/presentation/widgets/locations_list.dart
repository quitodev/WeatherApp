part of 'widgets.dart';

class LocationsList extends StatelessWidget {
  const LocationsList({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<LocationsCubit, LocationsState>(
        builder: (context, state) {
          if (state.locations.isNotEmpty) {
            return ListView.separated(
              shrinkWrap: true,
              itemCount: state.locations.length,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemBuilder: (context, index) {
                return LocationItem(
                  location: state.locations[index],
                );
              },
            );
          }
          return const LocationsEmpty();
        },
      ),
    );
  }
}
