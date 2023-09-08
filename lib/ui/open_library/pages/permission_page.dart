import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_example_learn/base/base_page_state.dart';
import 'package:permission_handler/permission_handler.dart';

/// @Author   lijie@baidu-mgame.com
/// @Date     2023/9/5 10:30
/// @Description  权限开源库（支持Android、IOS、Windows）

class PermissionPage extends StatefulWidget {
  const PermissionPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PermissionPageState();
  }
}

class _PermissionPageState extends BasePageState<PermissionPage> {
  @override
  Widget initWidget() {
    return Center(
      child: ListView(
          children: Permission.values
              .where((permission) {
                if (Platform.isIOS) {
                  return permission != Permission.unknown &&
                      permission != Permission.phone &&
                      permission != Permission.sms &&
                      permission != Permission.ignoreBatteryOptimizations &&
                      permission != Permission.accessMediaLocation &&
                      permission != Permission.activityRecognition &&
                      permission != Permission.manageExternalStorage &&
                      permission != Permission.systemAlertWindow &&
                      permission != Permission.requestInstallPackages &&
                      permission != Permission.accessNotificationPolicy &&
                      permission != Permission.bluetoothScan &&
                      permission != Permission.bluetoothAdvertise &&
                      permission != Permission.bluetoothConnect &&
                      permission != Permission.nearbyWifiDevices &&
                      permission != Permission.videos &&
                      permission != Permission.audio &&
                      permission != Permission.scheduleExactAlarm &&
                      permission != Permission.sensorsAlways;
                } else {
                  return permission != Permission.unknown &&
                      permission != Permission.mediaLibrary &&
                      permission != Permission.photosAddOnly &&
                      permission != Permission.reminders &&
                      permission != Permission.bluetooth &&
                      permission != Permission.appTrackingTransparency &&
                      permission != Permission.criticalAlerts;
                }
              })
              .map((permission) => PermissionWidget(permission))
              .toList()),
    );
  }

  @override
  String appBarTitle() {
    return 'permission_handler';
  }
}

/// Permission widget containing information about the passed [Permission]
class PermissionWidget extends StatefulWidget {
  /// Constructs a [PermissionWidget] for the supplied [Permission]
  const PermissionWidget(this._permission, {super.key});

  final Permission _permission;

  @override
  _PermissionState createState() => _PermissionState(_permission);
}

class _PermissionState extends State<PermissionWidget> {
  _PermissionState(this._permission);

  final Permission _permission;
  PermissionStatus _permissionStatus = PermissionStatus.denied;

  @override
  void initState() {
    super.initState();

    _listenForPermissionStatus();
  }

  void _listenForPermissionStatus() async {
    final status = await _permission.status;
    setState(() => _permissionStatus = status);
  }

  Color getPermissionColor() {
    switch (_permissionStatus) {
      case PermissionStatus.denied:
        return Colors.red;
      case PermissionStatus.granted:
        return Colors.green;
      case PermissionStatus.limited:
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        _permission.toString(),
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      subtitle: Text(
        _permissionStatus.toString(),
        style: TextStyle(color: getPermissionColor()),
      ),
      trailing: (_permission is PermissionWithService)
          ? IconButton(
              icon: const Icon(
                Icons.info,
                color: Colors.white,
              ),
              onPressed: () {
                checkServiceStatus(context, _permission as PermissionWithService);
              })
          : null,
      onTap: () {
        requestPermission(_permission);
      },
    );
  }

  void checkServiceStatus(BuildContext context, PermissionWithService permission) async {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text((await permission.serviceStatus).toString()),
    ));
  }

  Future<void> requestPermission(Permission permission) async {
    ///对于安卓来说，通过这边拿的状态点了不再提醒会返回permanentlyDenied
    final status = await permission.request();

    ///对于安卓来说，不管拒绝还是不再提醒的拒绝，返回都是granted
    final statusPermission = await permission.status;

    setState(() {
      print(status);
      _permissionStatus = status;
      print(_permissionStatus);
      print(statusPermission);
    });
  }
}
