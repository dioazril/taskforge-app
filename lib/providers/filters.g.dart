// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filters.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(StatusFilter)
const statusFilterProvider = StatusFilterProvider._();

final class StatusFilterProvider
    extends $NotifierProvider<StatusFilter, Status?> {
  const StatusFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'statusFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$statusFilterHash();

  @$internal
  @override
  StatusFilter create() => StatusFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Status? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Status?>(value),
    );
  }
}

String _$statusFilterHash() => r'8a52ad9c9bacac1b640b65be8dbb950eefdc526d';

abstract class _$StatusFilter extends $Notifier<Status?> {
  Status? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Status?, Status?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Status?, Status?>,
              Status?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(PriorityFilter)
const priorityFilterProvider = PriorityFilterProvider._();

final class PriorityFilterProvider
    extends $NotifierProvider<PriorityFilter, Priority?> {
  const PriorityFilterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'priorityFilterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$priorityFilterHash();

  @$internal
  @override
  PriorityFilter create() => PriorityFilter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(Priority? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<Priority?>(value),
    );
  }
}

String _$priorityFilterHash() => r'4e7b860c8be03c3b09735221eec31dc9436662b0';

abstract class _$PriorityFilter extends $Notifier<Priority?> {
  Priority? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<Priority?, Priority?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<Priority?, Priority?>,
              Priority?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(SearchQuery)
const searchQueryProvider = SearchQueryProvider._();

final class SearchQueryProvider extends $NotifierProvider<SearchQuery, String> {
  const SearchQueryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'searchQueryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$searchQueryHash();

  @$internal
  @override
  SearchQuery create() => SearchQuery();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$searchQueryHash() => r'd7661c7cd48d895c1983ea94c0c4b94ff6c761a8';

abstract class _$SearchQuery extends $Notifier<String> {
  String build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String, String>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String, String>,
              String,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(Sorter)
const sorterProvider = SorterProvider._();

final class SorterProvider extends $NotifierProvider<Sorter, SortMode> {
  const SorterProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sorterProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sorterHash();

  @$internal
  @override
  Sorter create() => Sorter();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SortMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SortMode>(value),
    );
  }
}

String _$sorterHash() => r'0f0dc93a18ce9f2c3c47c5684b7adaccfe8b1cbf';

abstract class _$Sorter extends $Notifier<SortMode> {
  SortMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SortMode, SortMode>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<SortMode, SortMode>,
              SortMode,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(filteredTodos)
const filteredTodosProvider = FilteredTodosProvider._();

final class FilteredTodosProvider
    extends $FunctionalProvider<List<Todo>, List<Todo>, List<Todo>>
    with $Provider<List<Todo>> {
  const FilteredTodosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'filteredTodosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$filteredTodosHash();

  @$internal
  @override
  $ProviderElement<List<Todo>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Todo> create(Ref ref) {
    return filteredTodos(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Todo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Todo>>(value),
    );
  }
}

String _$filteredTodosHash() => r'3e3336c3ee15121c806656c3ec9ffecd6f6e8bb3';
