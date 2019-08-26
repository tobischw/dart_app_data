[![Build Status](https://travis-ci.org/tobischw/dart_app_data.svg?branch=master)](https://travis-ci.org/tobischw/dart_app_data)
# dart_app_data
Dart Package for getting commonly used locations for storage on Windows, Mac, and Linux, such as the app data directories.

Inspired by [path_provider](https://pub.dev/packages/path_provider) (this does the same, except for Dart CLI apps or libs).

Originally written for a locally cached repository (think .m2 cache for Java). Tested and working on Windows, Mac, and Linux. **Flutter is not supported.**

## How to Install
Add this to your package's pubspec.yaml file:

```yml
dependencies:
  dart_app_data: ^1.0.1
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
# Troubleshooting
```
LocatorException: App caches are not supported for mobile devices
```
As the message says, this package is only for Dart applications that run on a traditional
operating system (such as Windows, Linux, Mac).

```
LocatorException: The user application path for this platform ("$path") does not exist on this system
```
Something went wrong during the path discovery (i.e.: the path does not exist). Is the app running as root? Did you a delete a common path somehow (see below)? Submit an Issue if this persists.

```
LocatorException: Platform-specific cache path for platform "$os" was not found
```
This means you're on an unsupported operating system.

# Paths
* Windows: C:\Users\MyUsername\AppData\Roaming
* macOS: /MyUsername/Library/Application Support
* Linux: /MyUsername/user/

# License
See `LICENSE` in repository.