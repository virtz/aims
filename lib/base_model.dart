import 'package:aims/core/models/aset_subcategory.dart';
import 'package:aims/core/models/asset_category.dart';
import 'package:aims/core/models/asset_condition.dart';
import 'package:aims/core/models/asset_name.dart';
import 'package:aims/core/models/asset_type.dart';
// import 'package:aims/core/models/captured_data.dart';
import 'package:aims/core/models/control.dart';
import 'package:aims/core/models/cost_center_model.dart';
import 'package:aims/core/models/drop1_data_model.dart';
import 'package:aims/core/models/drop2_data_model.dart';
import 'package:aims/core/models/drop3_data_model.dart';
import 'package:aims/core/models/location_model.dart';
import 'package:aims/core/models/parameter_setup.dart';
import 'package:aims/router/app_router.gr.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
// import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

// import 'core/models/cost_center_model.dart';
import 'core/models/site_status.dart';
import 'core/services/constants.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  setBusy(val) {
    _busy = val;
    notifyListeners();
    if (_busy == true) {
      CircularProgressIndicator();
    }
  }

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', ' ');
    final box = Hive.box<ConstCenter>(costcenterBoxName);
    box.clear();

    // await Hive.deleteBoxFromDisk(costcenterBoxName);
    final locationBox = Hive.box<LocationModel>(locationBoxName);
    locationBox.clear();

    // await Hive.deleteBoxFromDisk(locationBoxName);
    final parameterBox = Hive.box<ParameterSetUp>(parameterBoxName);
    parameterBox.clear();
    final siteIssuesBox = Hive.box<Status>(siteIssuesBoxName);
    siteIssuesBox.clear();
    // await Hive.deleteBoxFromDisk(parameterBoxName);

    final controlBox = Hive.box<Control>(controlBoxName);
    controlBox.clear();
    // await Hive.deleteBoxFromDisk(controlBoxName);
    // await Hive.deleteBoxFromDisk(assetCategoryBoxName);

    final assetCatBox = Hive.box<AssetCategory>(assetCategoryBoxName);
    assetCatBox.clear();

    // await Hive.deleteBoxFromDisk(assetSubCatogoryBoxName);

    final assetSubCat = Hive.box<AssetSubCategory>(assetSubCatogoryBoxName);

    assetSubCat.clear();

    final assetTypeBox = Hive.box<AssetType>(assetTypeBoxName);

    assetTypeBox.clear();

    // await Hive.deleteBoxFromDisk(assetTypeBoxName);

    final assetNameBox = Hive.box<AssetName>(assetNameBoxName);
    assetNameBox.clear();

    // await Hive.deleteBoxFromDisk(assetNameBoxName);
    final assetConditionBox = Hive.box<AssetCondition>(assetConditionBoxName);
    assetConditionBox.clear();

    // // await Hive.deleteBoxFromDisk(assetConditionBoxName);
    // // await Hive.deleteBoxFromDisk(captuedDataBoxName);
    final drop1Data = Hive.box<Drop1DataModel>(drop1DataBoxName);
    drop1Data.clear();
    final drop2Data = Hive.box<Drop2DataModel>(drop2DataBoxName);
    drop2Data.clear();

    final drop3Data = Hive.box<Drop3DataModel>(drop3DataBoxName);
    drop3Data.clear();

    // final capturedDataBox = Hive.box<CapturedData>(captuedDataBoxName);
    // capturedDataBox.clear();

    // await Hive.deleteFromDisk();
    notifyListeners();
    AutoRouter.of(context)
        .pushAndPopUntil(const Login(), predicate: (route) => false);
  }

  popUpMenuOption(int i, context) {
    switch (i) {
      case 1:
        logout(context);
        break;
      case 2:
        AutoRouter.of(context).push(PendingData());
        break;
      case 3:
        AutoRouter.of(context).push(const SubmittedData());
        break;
      case 4:
        AutoRouter.of(context).push(const RejectedData());
        break;
      default:
    }
  }
}
