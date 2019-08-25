import 'package:app_cache/app_cache.dart';

main() {
  var tempCache = AppCache.findOrCreate('appcache');
  print(tempCache.path);
}
