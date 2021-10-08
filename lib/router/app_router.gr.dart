// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i1;
import 'package:flutter/material.dart' as _i2;

import '../core/models/captured_data.dart' as _i13;
import '../ui/screens/auth/login/login.dart' as _i5;
import '../ui/screens/data_audit/data_audit.dart' as _i8;
import '../ui/screens/data_capture/data_capture.dart' as _i7;
import '../ui/screens/data_sceens/edit/edit.dart' as _i12;
import '../ui/screens/data_sceens/pending_data/pending_data.dart' as _i9;
import '../ui/screens/data_sceens/rejected_data/rejected_data.dart' as _i10;
import '../ui/screens/data_sceens/submitted_data/submitted_data.dart' as _i11;
import '../ui/screens/splash/splash_screen.dart' as _i3;
import '../ui/screens/start/start.dart' as _i4;
import '../ui/screens/welcome/welcome.dart' as _i6;

class AppRouter extends _i1.RootStackRouter {
  AppRouter([_i2.GlobalKey<_i2.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i1.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i3.SplashScreen();
        }),
    Start.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i4.Start();
        }),
    Login.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i5.Login();
        }),
    Welcome.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i6.Welcome();
        }),
    DataCapture.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i7.DataCapture();
        }),
    DataAudit.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i8.DataAudit();
        }),
    PendingData.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i9.PendingData();
        }),
    RejectedData.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i10.RejectedData();
        }),
    SubmittedData.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (_) {
          return const _i11.SubmittedData();
        }),
    Edit.name: (routeData) => _i1.MaterialPageX<dynamic>(
        routeData: routeData,
        builder: (data) {
          final args = data.argsAs<EditArgs>(orElse: () => const EditArgs());
          return _i12.Edit(key: args.key, data: args.data);
        })
  };

  @override
  List<_i1.RouteConfig> get routes => [
        _i1.RouteConfig(SplashScreen.name, path: '/'),
        _i1.RouteConfig(Start.name, path: '/Start'),
        _i1.RouteConfig(Login.name, path: '/Login'),
        _i1.RouteConfig(Welcome.name, path: '/Welcome'),
        _i1.RouteConfig(DataCapture.name, path: '/data-capture'),
        _i1.RouteConfig(DataAudit.name, path: '/data-audit'),
        _i1.RouteConfig(PendingData.name, path: '/pending-data'),
        _i1.RouteConfig(RejectedData.name, path: '/rejected-data'),
        _i1.RouteConfig(SubmittedData.name, path: '/submitted-data'),
        _i1.RouteConfig(Edit.name, path: '/Edit')
      ];
}

class SplashScreen extends _i1.PageRouteInfo {
  const SplashScreen() : super(name, path: '/');

  static const String name = 'SplashScreen';
}

class Start extends _i1.PageRouteInfo {
  const Start() : super(name, path: '/Start');

  static const String name = 'Start';
}

class Login extends _i1.PageRouteInfo {
  const Login() : super(name, path: '/Login');

  static const String name = 'Login';
}

class Welcome extends _i1.PageRouteInfo {
  const Welcome() : super(name, path: '/Welcome');

  static const String name = 'Welcome';
}

class DataCapture extends _i1.PageRouteInfo {
  const DataCapture() : super(name, path: '/data-capture');

  static const String name = 'DataCapture';
}

class DataAudit extends _i1.PageRouteInfo {
  const DataAudit() : super(name, path: '/data-audit');

  static const String name = 'DataAudit';
}

class PendingData extends _i1.PageRouteInfo {
  const PendingData() : super(name, path: '/pending-data');

  static const String name = 'PendingData';
}

class RejectedData extends _i1.PageRouteInfo {
  const RejectedData() : super(name, path: '/rejected-data');

  static const String name = 'RejectedData';
}

class SubmittedData extends _i1.PageRouteInfo {
  const SubmittedData() : super(name, path: '/submitted-data');

  static const String name = 'SubmittedData';
}

class Edit extends _i1.PageRouteInfo<EditArgs> {
  Edit({_i2.Key? key, _i13.CapturedData? data})
      : super(name, path: '/Edit', args: EditArgs(key: key, data: data));

  static const String name = 'Edit';
}

class EditArgs {
  const EditArgs({this.key, this.data});

  final _i2.Key? key;

  final _i13.CapturedData? data;
}
