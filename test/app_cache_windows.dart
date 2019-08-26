/// Tests have to be platform specific.
@TestOn("windows")

import 'dart:io';

import 'package:path/path.dart' as path_lib;
import 'package:app_cache/app_cache.dart';
import 'package:app_cache/src/locator.dart';
import 'package:test/test.dart';

void main() {
  test('Test Locator for Windows', () {
    // Ask for the path using our Locator API (that we are testing against).
    final path = Locator.getPlatformSpecificCachePath();
    // First, figure out correct user for Windows.
    final user = Platform.environment['UserProfile'];
    // Create the path that we know is correct.
    final correct_path = path_lib.join(user, 'AppData', 'Roaming');

    // The paths MUST match, otherwise an error occured somewhere.
    expect(path, correct_path);
  });
}
