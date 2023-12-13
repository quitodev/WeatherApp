import 'package:weather_app/app/app.dart';
import 'package:weather_app/app/core/utils/utils.dart';
import 'package:weather_app/bootstrap.dart';

Future<void> main() async {
  await bootstrap(
    () => const App(
      flavor: Flavor.production,
    ),
  );
}
