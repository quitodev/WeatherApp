import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:weather_app/app/core/routes/app_router.dart';
import 'package:weather_app/app/core/theme/theme.dart';
import 'package:weather_app/app/core/utils/utils.dart';
import 'package:weather_app/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({
    super.key,
    this.flavor = Flavor.development,
  });

  final Flavor flavor;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1920, 1080),
      child: MaterialApp.router(
        //title: 'Weather App',
        theme: AppThemes.lightTheme,
        routerConfig: AppRouter.router,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
