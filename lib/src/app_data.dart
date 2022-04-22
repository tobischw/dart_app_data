import 'dart:io';

import 'locator.dart';
import 'package:path/path.dart' as path_lib;

/// Represents a custom folder in the platform's AppData folder equivalence.
///
/// Use [name] to define the name of the folder. It will automatically be created
/// if it does not exist already. Access the path of the cache using [path] or
/// directly access the directory by using [directory].
class AppData {
  final String name;

  String get path => _path;
  Directory get directory => _directory;

  late String _path;
  late Directory _directory;

  AppData.findOrCreate(this.name) {
    _findOrCreate();
  }

  void _findOrCreate() {
    final cachePath = Locator.getPlatformSpecificCachePath();
    _path = path_lib.join(cachePath, name);

    _directory = Directory(_path);

    if (!_directory.existsSync()) {
      _directory.createSync();
    }
  }

  void delete() {
    _directory.delete(recursive: true);
  }

  void clear() {
    _directory.list(recursive: true).listen((FileSystemEntity entity) {
      entity.delete(recursive: true);
    });
  }
}
