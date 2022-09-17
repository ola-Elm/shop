import 'package:flutterapp/shared/cubit/states.dart';
// ممكن تستخدمي enum تمام
abstract class AppStates{}

class AppInitialState extends AppStates{}

class AppChangeBottomNavBarState extends AppStates{}

class AppCreateDataBaseStates extends AppStates{}

class AppGetDataBaseStates extends AppStates{}

class AppInsertDataBaseStates extends AppStates{}

class AppUpdateDataBaseStates extends AppStates{}

class AppDeleteDataBaseStates extends AppStates{}

class AppChangeBottomSheetState extends AppStates{}

class AppGetDataBaseLoadingStates extends AppStates{}

class AppChangeModeStates extends AppStates{}

