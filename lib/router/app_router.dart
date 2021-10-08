import 'package:aims/ui/screens/auth/login/login.dart';
import 'package:aims/ui/screens/data_audit/data_audit.dart';
import 'package:aims/ui/screens/data_capture/data_capture.dart';
import 'package:aims/ui/screens/data_sceens/edit/edit.dart';
import 'package:aims/ui/screens/data_sceens/pending_data/pending_data.dart';
import 'package:aims/ui/screens/data_sceens/rejected_data/rejected_data.dart';
import 'package:aims/ui/screens/data_sceens/submitted_data/submitted_data.dart';
import 'package:aims/ui/screens/splash/splash_screen.dart';
import 'package:aims/ui/screens/start/start.dart';
import 'package:aims/ui/screens/welcome/welcome.dart';
import 'package:auto_route/auto_route.dart';

@MaterialAutoRouter(replaceInRouteName: 'Page,Route', routes: <AutoRoute>[
  AutoRoute(page: SplashScreen, initial: true),
  AutoRoute(
    page: Start,
  ),
  AutoRoute(
    page: Login,
  ),
  AutoRoute(
    page: Welcome,
  ),
  AutoRoute(
    page: DataCapture,
  ),
  AutoRoute(
    page: DataAudit,
  ),
   AutoRoute(
    page: PendingData,
  ),
   AutoRoute(
    page: RejectedData,
  ),
   AutoRoute(
    page: SubmittedData,
  ),
     AutoRoute(
    page: Edit,
  )
  
])
class $AppRouter {}
