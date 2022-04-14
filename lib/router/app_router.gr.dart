// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../core/models/captured_data.dart' as _i13;
import '../ui/screens/auth/login/login.dart' as _i3;
import '../ui/screens/data_audit/data_audit.dart' as _i6;
import '../ui/screens/data_capture/data_capture.dart' as _i5;
import '../ui/screens/data_sceens/edit/edit.dart' as _i10;
import '../ui/screens/data_sceens/pending_data/pending_data.dart' as _i7;
import '../ui/screens/data_sceens/rejected_data/rejected_data.dart' as _i8;
import '../ui/screens/data_sceens/submitted_data/submitted_data.dart' as _i9;
import '../ui/screens/splash/splash_screen.dart' as _i1;
import '../ui/screens/start/start.dart' as _i2;
import '../ui/screens/welcome/welcome.dart' as _i4;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i1.SplashScreen());
    },
    Start.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.Start());
    },
    Login.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.Login());
    },
    Welcome.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.Welcome());
    },
    DataCapture.name: (routeData) {
      final args = routeData.argsAs<DataCaptureArgs>(
          orElse: () => const DataCaptureArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.DataCapture(
              key: args.key, cd: args.cd, isFromAudit: args.isFromAudit));
    },
    DataAudit.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i6.DataAudit());
    },
    PendingData.name: (routeData) {
      final args = routeData.argsAs<PendingDataArgs>(
          orElse: () => const PendingDataArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i7.PendingData(key: args.key, isEditied: args.isEditied));
    },
    RejectedData.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.RejectedData());
    },
    SubmittedData.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.SubmittedData());
    },
    Edit.name: (routeData) {
      final args = routeData.argsAs<EditArgs>(orElse: () => const EditArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i10.Edit(key: args.key, data: args.data));
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(SplashScreen.name, path: '/'),
        _i11.RouteConfig(Start.name, path: '/Start'),
        _i11.RouteConfig(Login.name, path: '/Login'),
        _i11.RouteConfig(Welcome.name, path: '/Welcome'),
        _i11.RouteConfig(DataCapture.name, path: '/data-capture'),
        _i11.RouteConfig(DataAudit.name, path: '/data-audit'),
        _i11.RouteConfig(PendingData.name, path: '/pending-data'),
        _i11.RouteConfig(RejectedData.name, path: '/rejected-data'),
        _i11.RouteConfig(SubmittedData.name, path: '/submitted-data'),
        _i11.RouteConfig(Edit.name, path: '/Edit')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i11.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.Start]
class Start extends _i11.PageRouteInfo<void> {
  const Start() : super(Start.name, path: '/Start');

  static const String name = 'Start';
}

/// generated route for
/// [_i3.Login]
class Login extends _i11.PageRouteInfo<void> {
  const Login() : super(Login.name, path: '/Login');

  static const String name = 'Login';
}

/// generated route for
/// [_i4.Welcome]
class Welcome extends _i11.PageRouteInfo<void> {
  const Welcome() : super(Welcome.name, path: '/Welcome');

  static const String name = 'Welcome';
}

/// generated route for
/// [_i5.DataCapture]
class DataCapture extends _i11.PageRouteInfo<DataCaptureArgs> {
  DataCapture({_i12.Key? key, _i13.CapturedData? cd, bool isFromAudit = false})
      : super(DataCapture.name,
            path: '/data-capture',
            args: DataCaptureArgs(key: key, cd: cd, isFromAudit: isFromAudit));

  static const String name = 'DataCapture';
}

class DataCaptureArgs {
  const DataCaptureArgs({this.key, this.cd, this.isFromAudit = false});

  final _i12.Key? key;

  final _i13.CapturedData? cd;

  final bool isFromAudit;

  @override
  String toString() {
    return 'DataCaptureArgs{key: $key, cd: $cd, isFromAudit: $isFromAudit}';
  }
}

/// generated route for
/// [_i6.DataAudit]
class DataAudit extends _i11.PageRouteInfo<void> {
  const DataAudit() : super(DataAudit.name, path: '/data-audit');

  static const String name = 'DataAudit';
}

/// generated route for
/// [_i7.PendingData]
class PendingData extends _i11.PageRouteInfo<PendingDataArgs> {
  PendingData({_i12.Key? key, bool isEditied = false})
      : super(PendingData.name,
            path: '/pending-data',
            args: PendingDataArgs(key: key, isEditied: isEditied));

  static const String name = 'PendingData';
}

class PendingDataArgs {
  const PendingDataArgs({this.key, this.isEditied = false});

  final _i12.Key? key;

  final bool isEditied;

  @override
  String toString() {
    return 'PendingDataArgs{key: $key, isEditied: $isEditied}';
  }
}

/// generated route for
/// [_i8.RejectedData]
class RejectedData extends _i11.PageRouteInfo<void> {
  const RejectedData() : super(RejectedData.name, path: '/rejected-data');

  static const String name = 'RejectedData';
}

/// generated route for
/// [_i9.SubmittedData]
class SubmittedData extends _i11.PageRouteInfo<void> {
  const SubmittedData() : super(SubmittedData.name, path: '/submitted-data');

  static const String name = 'SubmittedData';
}

/// generated route for
/// [_i10.Edit]
class Edit extends _i11.PageRouteInfo<EditArgs> {
  Edit({_i12.Key? key, _i13.CapturedData? data})
      : super(Edit.name, path: '/Edit', args: EditArgs(key: key, data: data));

  static const String name = 'Edit';
}

class EditArgs {
  const EditArgs({this.key, this.data});

  final _i12.Key? key;

  final _i13.CapturedData? data;

  @override
  String toString() {
    return 'EditArgs{key: $key, data: $data}';
  }
}
