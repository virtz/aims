import 'package:aims/core/models/aset_subcategory.dart';
import 'package:aims/core/models/asset_category.dart';
import 'package:aims/core/models/asset_condition.dart';
import 'package:aims/core/models/asset_name.dart';
import 'package:aims/core/models/asset_type.dart';
import 'package:aims/core/models/captured_data.dart';
import 'package:aims/core/models/control.dart';
import 'package:aims/core/models/cost_center_model.dart';
import 'package:aims/core/models/drop1_data_model.dart';
import 'package:aims/core/models/drop3_data_model.dart';
import 'package:aims/core/models/location_model.dart';
import 'package:aims/core/models/misc.dart';
import 'package:aims/core/models/parameter_setup.dart';
import 'package:aims/core/models/site_status.dart';
import 'package:aims/core/services/constants.dart';
import 'package:aims/locator.dart';
import 'package:aims/router/app_router.gr.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

import 'package:flutter/material.dart';

import 'core/models/drop3_data_model.dart';
import 'core/models/drop2_data_model.dart';
// import 'package:hive/hive.dart';

void main() async {
  setupLocator();
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  final appDocumentDirectory = await getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  Hive.registerAdapter(ConstCenterAdapter());
  Hive.registerAdapter(LocationModelAdapter());
  Hive.registerAdapter(ParameterSetUpAdapter());
  Hive.registerAdapter(ControlAdapter());
  Hive.registerAdapter(AssetCategoryAdapter());
  Hive.registerAdapter(AssetSubCategoryAdapter());
  Hive.registerAdapter(AssetTypeAdapter());
  Hive.registerAdapter(AssetNameAdapter());
  Hive.registerAdapter(AssetConditionAdapter());
  Hive.registerAdapter(CapturedDataAdapter());
  Hive.registerAdapter(StatusAdapter());
  Hive.registerAdapter(Drop1DataModelAdapter());
  Hive.registerAdapter(Drop2DataModelAdapter());
  Hive.registerAdapter(Drop3DataModelAdapter());
  Hive.registerAdapter(MiscAdapter());

  await Hive.openBox<ConstCenter>(costcenterBoxName);
  await Hive.openBox<LocationModel>(locationBoxName);
  await Hive.openBox<ParameterSetUp>(parameterBoxName);
  await Hive.openBox<Control>(controlBoxName);
  await Hive.openBox<AssetCategory>(assetCategoryBoxName);
  await Hive.openBox<AssetSubCategory>(assetSubCatogoryBoxName);
  await Hive.openBox<AssetType>(assetTypeBoxName);
  await Hive.openBox<AssetName>(assetNameBoxName);
  await Hive.openBox<AssetCondition>(assetConditionBoxName);
  await Hive.openBox<CapturedData>(captuedDataBoxName);
  await Hive.openBox<Status>(siteIssuesBoxName);
  await Hive.openBox<Drop1DataModel>(drop1DataBoxName);
  await Hive.openBox<Drop2DataModel>(drop2DataBoxName);
  await Hive.openBox<Drop3DataModel>(drop3DataBoxName);
  await Hive.openBox<Misc>(miscBoxName);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Aims',
      theme: ThemeData(primaryColor: Colors.purple, accentColor: Colors.green),
      debugShowCheckedModeBanner: false,
      routeInformationParser: _appRouter.defaultRouteParser(),
      routerDelegate: _appRouter.delegate(),
    );
  }
}
