import 'dart:io';

import 'locator.dart';
import 'package:path/path.dart' as path_lib;

class AppCache {
  String path;
  String _name;

  AppCache.findOrCreate(this._name) {
    _findOrCreate();
  }

  _findOrCreate() {
    final cachePath = Locator.getPlatformSpecificCachePath();
    path = path_lib.join(cachePath, _name);
    
    if(!Directory(path).existsSync()) {
      Directory(path).createSync();
    }
  }
}

class AppCacheException implements Exception {
  final String message;

  const AppCacheException(this.message);

  String toString() => 'AppCacheException: $message';
}
