part of 'pages.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({
    required this.forecast,
    super.key,
  });

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForecastCubit(
        day: forecast.days.first,
      ),
      child: _ForecastContent(
        forecast: forecast,
      ),
    );
  }
}

class _ForecastContent extends StatelessWidget {
  const _ForecastContent({
    required this.forecast,
  });

  final Forecast forecast;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(
          color: theme.colorScheme.onPrimary,
        ),
        systemOverlayStyle: SystemUiOverlayStyle.light,
      ),
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
                Center(
                  child: CustomText(
                    text: forecast.location.name,
                    color: theme.colorScheme.onPrimary,
                    fontSize: 30.spMax,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                Center(
                  child: CustomText(
                    text:
                        '${forecast.current.tempC} | ${forecast.current.conditionText}',
                    color: theme.colorScheme.onSurface,
                    fontSize: 20.spMax,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                CustomText(
                  text: l10n.extendedForecast,
                  color: theme.colorScheme.onPrimary,
                  fontSize: 18.spMax,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                DaysList(
                  days: forecast.days,
                ),
                const SizedBox(
                  height: 24,
                ),
                CustomText(
                  text: l10n.forecastHourly,
                  color: theme.colorScheme.onPrimary,
                  fontSize: 18.spMax,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(
                  height: 8,
                ),
                const HoursList(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
