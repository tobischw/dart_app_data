[![Build Status](https://travis-ci.org/tobischw/app_cache.svg?branch=master)](https://travis-ci.org/tobischw/app_cache)
# app_cache
Dart Package for getting commonly used locations for storage on Windows, Mac, and Linux, such as the app data directories.

Inspired by [path_provider](https://pub.dev/packages/path_provider) (this does the same, except for Dart CLI apps or libs).

Originally written for a locally cached repository (think .m2 cache for Java).

## How to Install
Add this to your package's pubspec.yaml file:

```yml
dependencies:
  app_cache: ^5.1.2
```

## Usage
```dart
import 'package:app_cache/app_cache.dart';
...

// Creates a folder if it does not already exist (only call once).
final myCache = AppCache.findOrCreate('.my_app');

// Get the location of the folder as a String
print(myCache.path); // Outputs: C:\Users\MyUsername\AppData\Roaming\.my_app

// Get the location of the folder directly as a directory
print(myCache.directory);

// Get the name of the cache
print(myCache.name); // Outputs: .my_app

// ... Do whatever you want with the folder now.
// Want to delete it?
myCache.delete();
```
### Without AppCache
```dart
import 'package:app_cache/src/locator.dart';
...

// No need for the AppCache abstraction? Use the Locator helper.
print(Locator.getPlatformSpecificCachePath()); 
// Outputs: C:\Users\MyUsername\AppData\Roaming
```