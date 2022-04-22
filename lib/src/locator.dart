import 'dart:io' show Directory, Platform;
import 'package:path/path.dart' as path_lib;

/// Static helper class for determining platform's app data path.
///
/// Does not require [AppData] to work, can be standalone.
/// Paths for MacOS and Linux were choosen based on popular
/// StackOverflow answers. Submit a PR if you believe these are
/// wrong.
class Locator {
  static String getPlatformSpecificCachePath() {
    var os = Platform.operatingSystem;
    switch (os) {
      case 'windows':
        return _verify(_findWindows());
      case 'linux':
        return _verify(_findLinux());
      case 'macos':
        return _verify(_findMacOS());
      case 'android':
      case 'ios':
        throw LocatorException(
            'App caches are not supported for mobile devices');
    }
    throw LocatorException(
        'Platform-specific cache path for platform "$os" was not found');
  }

  static String _verify(String path) {
    if (Directory(path).existsSync()) {
      return path;
    }
    throw LocatorException(
        'The user application path for this platform ("$path") does not exist on this system');
  }

  static String _findWindows() {
    return path_lib.join(
        Platform.environment['UserProfile']!, 'AppData', 'Roaming');
  }

  static String _findMacOS() {
    return path_lib.join(
        Platform.environment['HOME']!, 'Library', 'Application Support');
  }

  static String _findLinux() {
    return path_lib.join('home', Platform.environment['HOME']);
  }
}

class LocatorException implements Exception {
  final String message;

  const LocatorException(this.message);

  @override
  String toString() => 'LocatorException: $message';
}
