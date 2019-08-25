import 'dart:io' show Platform;
import 'package:path/path.dart' as path_lib;

class Locator {
  static String getPlatformSpecificCachePath() {
    String os = Platform.operatingSystem;
    switch (os) {
      case 'windows':
        return _findWindows();
      case 'linux':
        return _findLinux();
      case 'macos':
        return _findMacOS();
      case 'android':
      case 'ios':
        throw LocatorException('App caches are not supported for mobile devices');
    }
    throw LocatorException(
        'Platform-specific cache path for OS \'$os\' was not found');
  }

  static String _findWindows() {
    return path_lib.join(Platform.environment['UserProfile'], 'AppData', 'Roaming');
  }

  static String _findMacOS() {
    return '~/Library/Application Support';
  }

  static String _findLinux() {
    return 'linux path!';
  }
}

class LocatorException implements Exception {
  final String message;

  const LocatorException(this.message);

  String toString() => 'LocatorException: $message';
}
