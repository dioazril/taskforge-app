import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'utils_provider.g.dart';

/// A provider to manage the app's theme (light or dark).
@riverpod
class IsLightTheme extends _$IsLightTheme {
  @override
  bool build() {
    return true;
  }

  /// Toggles the theme between light and dark.
  void toggle() {
    state = !state;
  }
}
