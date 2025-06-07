// main.dart
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sorting_visualizer/services/shared_preference_service.dart';
import 'package:sorting_visualizer/setup_bottom_sheet.dart';
import 'package:sorting_visualizer/setup_dialogs.dart';
import 'package:sorting_visualizer/setup_snackbar_ui.dart';
import 'package:sorting_visualizer/ui/theme_setup.dart';
import 'package:sorting_visualizer/ui/ui_theme.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:stacked_themes/stacked_themes.dart';
import 'package:injectable/injectable.dart'; // <--- ADD THIS IMPORT

import 'app/locator.dart';
import 'app/router.router.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Pass the default production environment here.
  // This makes the setupLocator call consistent with how we call it in tests,
  // where we pass Environment.test.
  setupLocator(environment: Environment.prod); // <--- THIS LINE IS GOOD

  setupDialogUi();
  setupBottomSheetUI();
  setupSnackBarUi();
  await ThemeManager.initialise();

  // In production, we explicitly initialize the *real* SharedPreferenceService here
  // after it has been registered by setupLocator().
  final SharedPreferenceService _sharedPrefService =
  locator<SharedPreferenceService>();
  await _sharedPrefService.initialise();

  var style =
  SystemUiOverlayStyle(systemNavigationBarColor: darkBackgroundFinish);
  SystemChrome.setSystemUIOverlayStyle(style);
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  // THIS IS THE CRITICAL CHANGE:
  // Pass the already initialized real service to MyApp.
  // This makes MyApp's construction synchronous and robust in production,
  // and crucially, ensures the MyApp constructor in the test environment
  // behaves consistently when the mock is passed.
  runApp(MyApp(sharedPreferenceService: _sharedPrefService)); // <--- CHANGE THIS LINE
}

class MyApp extends StatelessWidget {
  // Make this field nullable and add it to the constructor
  final SharedPreferenceService? _sharedPrefService;

  // Add an optional parameter to the constructor.
  // If not provided (in production), it defaults to fetching from locator.
  // In tests, we will provide the mock.
  const MyApp({Key? key, SharedPreferenceService? sharedPreferenceService})
      : _sharedPrefService = sharedPreferenceService, // Assign provided service
        super(key: key);

  // Helper getter to ensure we always have a service instance
  SharedPreferenceService get sharedPrefService =>
      _sharedPrefService ?? locator<SharedPreferenceService>();

  @override
  Widget build(BuildContext context) {
    return ThemeBuilder(
        themes: getThemes(),
        builder: (context, regularTheme, darkTheme, themeMode) => MaterialApp(
          theme: regularTheme,
          debugShowCheckedModeBanner: false,
          //   darkTheme: darkTheme, // Keep commented if you intend to
          themeMode: themeMode,
          title: 'SortLabs',
          initialRoute: _getStartupRoute(),
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorKey: StackedService.navigatorKey,
        ));
  }

  String _getStartupRoute() {
    // Use the new getter
    if (!sharedPrefService.homeVisible) {
      return Routes.onBoardingView;
    } else {
      return Routes.homeView;
    }
  }
}