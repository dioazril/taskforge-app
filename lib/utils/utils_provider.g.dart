// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'utils_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// A provider to manage the app's theme (light or dark).

@ProviderFor(IsLightTheme)
const isLightThemeProvider = IsLightThemeProvider._();

/// A provider to manage the app's theme (light or dark).
final class IsLightThemeProvider extends $NotifierProvider<IsLightTheme, bool> {
  /// A provider to manage the app's theme (light or dark).
  const IsLightThemeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'isLightThemeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$isLightThemeHash();

  @$internal
  @override
  IsLightTheme create() => IsLightTheme();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$isLightThemeHash() => r'0d9bffbeba583fc5ed37dae07172e209c577fc10';

/// A provider to manage the app's theme (light or dark).

abstract class _$IsLightTheme extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
