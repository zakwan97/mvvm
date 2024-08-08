import 'package:permission_handler/permission_handler.dart';

mixin PermissionHandler {
  Future<bool> requestStoragePermission() async {
    final status = await Permission.storage.status;
    if (status.isDenied) {
      // We didn't ask for permission yet or the permission has been denied before but not permanently.
    }

    // You can can also directly ask the permission about its status.
    if (await Permission.storage.isRestricted) {
      // The OS restricts access, for example because of parental controls.
    }

    if (await Permission.storage.isPermanentlyDenied) {
      // The user opted to never again see the permission request dialog for this
      // app. The only way to change the permission's status now is to let the
      // user manually enable it in the system settings.
      await openAppSettings();
    }

    final permisson = await Permission.storage.request().isGranted;
    return permisson;
  }

  Future<bool> checkCameraPermission() async {
    final status = await Permission.camera.status;
    return status.isGranted | status.isLimited;
  }

  Future<bool> requestCameraPermission() async {
    final requestStatus = await Permission.camera.request();

    final cameraPermission = requestStatus.isGranted | requestStatus.isLimited;

    return cameraPermission;
  }
}
