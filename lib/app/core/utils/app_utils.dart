part of 'utils.dart';

class AppUtils {
  static void showSnackbar(BuildContext context, String text) {
    final theme = Theme.of(context);

    Future.delayed(const Duration(milliseconds: 500), () {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: CustomText(
            text: text,
            color: theme.colorScheme.onPrimary,
            maxLines: 5,
          ),
        ),
      );
    });
  }

  static Future<bool> userHasInternet() async {
    return getIt<Connectivity>().checkConnectivity().then(
      (value) {
        switch (value) {
          case ConnectivityResult.mobile:
            return true;
          case ConnectivityResult.wifi:
            return true;
          case ConnectivityResult.ethernet:
            return true;
          case ConnectivityResult.vpn:
            return true;
          // ignore: no_default_cases
          default:
            return false;
        }
      },
      onError: (error) => throw Exception(error),
    );
  }
}
