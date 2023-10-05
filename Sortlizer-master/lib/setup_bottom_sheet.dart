import 'package:sorting_visualizer/app/locator.dart';
import 'package:sorting_visualizer/datamodels/bottomSheetType.dart';
import 'package:sorting_visualizer/ui/bottomsheets/custom_array_bottomsheet.dart';
import 'package:stacked_services/stacked_services.dart';

void setupBottomSheetUI() {
  var bottomSheetService = locator<BottomSheetService>();
  var builders = {
    BottomSheetType.CUSTOM_ARRAY: (context, sheetRequest, completer) =>
        CustomArrayBottomSheet(
          sheetRequest: sheetRequest,
          onDialogTap: completer,
        )
  };

  bottomSheetService.setCustomSheetBuilders(builders);
}