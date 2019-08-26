import 'dart:io';

import 'locator.dart';
import 'package:path/path.dart' as path_lib;

/// Represents a custom folder in the platform's AppData folder equivalence.
/// 
/// Use [name] to define the name of the folder. It will automatically be created
/// if it does not exist already. Access the path of the cache using [path] or 
/// directly access the directory by using [directory].
class AppCache {
  final String name;

  String get path => _path;
  Directory get directory => _directory;

  String _path;
  Directory _directory;

  AppCache.findOrCreate(this.name) {
    _findOrCreate();
  }

  _findOrCreate() {
    final cachePath = Locator.getPlatformSpecificCachePath();
    _path = path_lib.join(cachePath, name);

    _directory = Directory(_path);

    if (!_directory.existsSync()) {
      _directory.createSync();
    }
  }

  delete() {
    _directory.delete(recursive: true);
  }

  clear() {
    _directory.list(recursive: true).listen((FileSystemEntity entity) {
      entity.delete(recursive: true);
    });
  }
}

class AppCacheException implements Exception {
  final String message;

  const AppCacheException(this.message);

  String toString() => 'AppCacheException: $message';
}
