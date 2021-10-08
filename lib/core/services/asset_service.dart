import 'package:aims/core/models/aset_subcategory.dart';
import 'package:aims/core/models/asset_category.dart';
import 'package:aims/core/models/asset_condition.dart';
import 'package:aims/core/models/asset_name.dart';
import 'package:aims/core/models/asset_type.dart';
import 'package:aims/core/models/captured_data.dart';
import 'package:aims/core/models/drop1_data_model.dart';
import 'package:aims/core/models/drop2_data_model.dart';
import 'package:aims/core/models/drop3_data_model.dart';
import 'package:aims/core/models/error_model.dart';
import 'package:aims/core/models/site_status.dart';
import 'package:aims/core/models/success._model.dart';
import 'package:aims/core/services/constants.dart';
import 'package:aims/core/services/index.dart';
import 'package:aims/utils/paths.dart';
import 'package:hive/hive.dart';

class AssetService {
  getAssetCategory(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.GET_ASSET_CAT, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<AssetCategory> assetCategoryList =
          List.from(data.map((item) => AssetCategory.fromJson(item)));
      var assetCategory = Hive.box<AssetCategory>(assetCategoryBoxName);
      for (var ast in assetCategoryList) {
        assetCategory.put(ast.id, ast);
      }
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getAssetSubCategory(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.GET_ASSET_SUBCAT, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<AssetSubCategory> assetSubCategoryList =
          List.from(data.map((item) => AssetSubCategory.fromJson(item)));
      var assetSubCat = Hive.box<AssetSubCategory>(assetSubCatogoryBoxName);
      for (var astsc in assetSubCategoryList) {
        assetSubCat.put(astsc.id, astsc);
      }

      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getAssetType(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.GET_ASSET_TYPE, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<AssetType> assettypeList =
          List.from(data.map((item) => AssetType.fromJson(item)));
      var assetTypes = Hive.box<AssetType>(assetTypeBoxName);
      for (var assetType in assettypeList) {
        assetTypes.put(assetType.id, assetType);
      }
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getAssetName(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.GET_ASSET_NAME, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<AssetName> assetNameList =
          List.from(data.map((item) => AssetName.fromJson(item)));
      var assetNames = Hive.box<AssetName>(assetNameBoxName);
      // assetNames.addAll(assetNameList);
      for (var assetName in assetNameList) {
        assetNames.put(assetName.id, assetName);
      }
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getAssetCondition() async {
    try {
      final result = await http.get(Paths.GET_ASSET_CONDITION);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<AssetCondition> assetConditionList =
          List.from(data.map((item) => AssetCondition.fromJson(item)));
      var assetConditions = Hive.box<AssetCondition>(assetConditionBoxName);
      // assetNames.addAll(assetNameList);
      for (var condition in assetConditionList) {
        assetConditions.put(condition.id, condition);
      }
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getSiteIssues() async {
    try {
      final result = await http.get(Paths.GET_SITE_ISSUES);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<Status> statusList =
          List.from(data.map((item) => Status.fromJson(item)));
      var statusBox = Hive.box<Status>(siteIssuesBoxName);
      // assetNames.addAll(assetNameList);
      for (var status in statusList) {
        statusBox.put(status.ID, status);
      }
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  submitDataToServer(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.SUBMIT_DATA, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      print(result.data);
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getDrop1Data(String client) async {
    try {
      final result = await http.get(Paths.GET_DROP1_DATA + "/$client");
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      print('|||||||||||||||||||||||||||||||||||');
      print("from assetService ${result.data}");
      var data = result.data;
      List<Drop1DataModel> drop1Data =
          List.from(data.map((item) => Drop1DataModel.fromJson(item)));
      var drop1Box = Hive.box<Drop1DataModel>(drop1DataBoxName);
      // assetNames.addAll(assetNameList);
      for (var drop1 in drop1Data) {
        drop1Box.put(drop1.id, drop1);
      }
      print(" |||||||| this is from drop 1 assetService  ${drop1Box.values}");
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getDrop2Data(String client) async {
    try {
      final result = await http.get(Paths.GET_DROP2_DATA + "/$client");
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<Drop2DataModel> drop2Data =
          List.from(data.map((item) => Drop2DataModel.fromJson(item)));
      var drop2Box = Hive.box<Drop2DataModel>(drop2DataBoxName);
      // assetNames.addAll(assetNameList);
      for (var drop2 in drop2Data) {
        drop2Box.put(drop2.id, drop2);
      }
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  getDrop3Data(String client) async {
    try {
      final result = await http.get(Paths.GET_DROP3_DATA + "/$client");
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;
      List<Drop3DataModel> drop3Data =
          List.from(data.map((item) => Drop3DataModel.fromJson(item)));
      var drop3Box = Hive.box<Drop3DataModel>(drop3DataBoxName);
      // assetNames.addAll(assetNameList);
      for (var drop3 in drop3Data) {
        drop3Box.put(drop3.id, drop3);
      }
      return SuccessModel(result.data);
    } catch (e) {
      return ErrorModel(e);
    }
  }

  fetchFromDataCapture(Map<String, dynamic> json) async {
    try {
      final result = await http.post(Paths.FETCH_DATA, json);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      var data = result.data;

      List<CapturedData> capturedData =
          List.from(data.map((item) => CapturedData.fromJson(item)));
      return SuccessModel(capturedData);
    } catch (e) {
      return ErrorModel(e.toString());
    }
  }

  findDuplocate(Map<String, dynamic> payload) async {
    try {
      final result = await http.post(Paths.FETCH_COPY, payload);
      if (result is ErrorModel) {
        return ErrorModel(result.error);
      }
      if (result is SuccessModel) {
        return SuccessModel(result.data);
      }
    } catch (e) {
      return ErrorModel(e);
    }
  }
}
