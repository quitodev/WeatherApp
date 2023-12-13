part of 'pages.dart';

class LocationsPage extends StatelessWidget {
  const LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LocationsCubit(
        searchLocation: getIt<SearchLocation>(),
        getForecast: getIt<GetForecast>(),
      ),
      child: BlocConsumer<LocationsCubit, LocationsState>(
        listener: (context, state) {
          if (state.status is LocationSelected) {
            context.pushNamed(
              Routes.routeForecast.name,
              extra: state.forecast,
            );
          }
          if (state.status is LocationsError) {
            AppUtils.showSnackbar(
              context,
              (state.status as LocationsError).text,
            );
          }
        },
        builder: (context, state) {
          if (state.status is LocationsLoading) {
            return const CustomProgress();
          }
          return const _LocationsContent();
        },
      ),
    );
  }
}

class _LocationsContent extends StatelessWidget {
  const _LocationsContent();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

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
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 32,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 16,
                ),
                CustomText(
                  text: l10n.titleApp,
                  color: theme.colorScheme.onPrimary,
                  fontSize: 26.spMax,
                ),
                const SizedBox(
                  height: 8,
                ),
                CustomSearchField(
                  hintText: l10n.searchHint,
                  onChanged: (value) {
                    if (value.length > 3) {
                      context.read<LocationsCubit>().searchLocation(value);
                    }
                  },
                ),
                const LocationsList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
