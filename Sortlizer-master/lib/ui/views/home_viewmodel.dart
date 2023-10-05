import 'package:flutter/services.dart';
import 'package:share/share.dart';
import 'package:sorting_visualizer/app/locator.dart';
import 'package:sorting_visualizer/app/router.router.dart';
import 'package:sorting_visualizer/datamodels/algorithmType.dart';
import 'package:sorting_visualizer/datamodels/dialogType.dart';
import 'package:sorting_visualizer/services/shared_preference_service.dart';
import 'package:sorting_visualizer/utils/app_info.dart';
import 'package:sorting_visualizer/utils/contents.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:url_launcher/url_launcher.dart';

class HomeViewModel extends BaseViewModel {
  final _navigationService = locator<NavigationService>();
  final _dialogService = locator<DialogService>();
  final _sharedPrefService = locator<SharedPreferenceService>();

  HomeViewModel();

  getAlgorithmsList() {
    return DataContent().getAlgorithms();
  }

  moveToVisualizerView() async {
    AlgorithmType _algoType = _sharedPrefService.algorithmSelected != null
        ? getAlgoTypeFromString(_sharedPrefService.algorithmSelected!)
        : AlgorithmType.BUBBLE_SORT;
    await _navigationService.navigateTo(Routes.visualizerView,
        arguments: VisualizerViewArguments(algorithmType: _algoType));
  }

  void showAboutApp() async {
    var desc = "SortLab: Visualize and Understand Sorting Algorithms.\n\n" + "Visualize different sorting algorithms step-by-step.\n\n" +
        "Easily understand how the sorting algorithms differ in terms of size, space, and time";


    await _dialogService.showCustomDialog(
        variant: DialogType.ABOUT_APP,
        title: "About",
        description: desc,
        barrierDismissible: true);
  }

  void onShareBtnTap() async {
    var appUrl = "https://play.google.com/store/apps/details?id=" + packageName;
    var message =
        "Try out this amazing Sorting Visualizer app on PlayStore!\n\n$appUrl";

    Share.share(message, subject: "Share to");
  }

  void onReviewBtnTap() async {
    try {
      // launch("market://details?id=" + packageName);
      launchUrl(Uri.parse(
          "https://play.google.com/store/apps/details?id=" + packageName), mode: LaunchMode.externalApplication);
    } on PlatformException catch (_) {
      launchUrl(Uri.parse(
          "https://play.google.com/store/apps/details?id=" + packageName), mode: LaunchMode.externalApplication);
    } finally {
      launchUrl(Uri.parse(
          "https://play.google.com/store/apps/details?id=" + packageName), mode: LaunchMode.externalApplication);
    }
  }
}
