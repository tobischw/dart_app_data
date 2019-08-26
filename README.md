[![Build Status](https://travis-ci.org/tobischw/app_cache.svg?branch=master)](https://travis-ci.org/tobischw/app_cache)
# dart_app_data
Dart Package for getting commonly used locations for storage on Windows, Mac, and Linux, such as the app data directories.

Inspired by [path_provider](https://pub.dev/packages/path_provider) (this does the same, except for Dart CLI apps or libs).

Originally written for a locally cached repository (think .m2 cache for Java). Tested and working on Windows, Mac, and Linux. **Flutter is not supported.**

## How to Install
Add this to your package's pubspec.yaml file:

```yml
dependencies:
  dart_app_data: ^1.0.0
```

## Usage
### With AppData
```dart
import 'package:dart_app_data/dart_app_data.dart';
...

// Creates a folder if it does not already exist (only call once).
final myData = AppData.findOrCreate('.my_app');

// Get the location of the folder as a String
print(myData.path); // Outputs: C:\Users\MyUsername\AppData\Roaming\.my_app

// Get the location of the folder directly as a directory
print(myData.directory);

// Get the name of the cache
print(myData.name); // Outputs: .my_app

// ... Do whatever you want with the folder now.
// Want to delete it?
// myData.delete();
```
### Without AppData
```dart
import 'package:dart_app_data/src/locator.dart';
...

// No need for the AppData abstraction? Use the Locator helper.
print(Locator.getPlatformSpecificCachePath()); 
// Outputs: C:\Users\MyUsername\AppData\Roaming
```
### License
See `LICENSE` in repository.