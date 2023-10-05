import 'package:sorting_visualizer/ui/views/onboarding_view.dart';
import 'package:sorting_visualizer/ui/views/settings_view.dart';
import 'package:sorting_visualizer/ui/views/sorting_detailed_view.dart';
import 'package:sorting_visualizer/ui/views/visualizer_view.dart';
import 'package:sorting_visualizer/ui/views/home_view.dart';
import 'package:stacked/stacked_annotations.dart';

@StackedApp(routes: [
  MaterialRoute(page: OnBoardingView, initial: true),
  MaterialRoute(page: HomeView),
  MaterialRoute(page: VisualizerView),
  MaterialRoute(page: SortingDetailedView),
  MaterialRoute(page: SettingsView)
])
class $Router {}
