// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appDatabase)
const appDatabaseProvider = AppDatabaseProvider._();

final class AppDatabaseProvider
    extends $FunctionalProvider<AppDatabase, AppDatabase, AppDatabase>
    with $Provider<AppDatabase> {
  const AppDatabaseProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'appDatabaseProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$appDatabaseHash();

  @$internal
  @override
  $ProviderElement<AppDatabase> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppDatabase create(Ref ref) {
    return appDatabase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppDatabase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppDatabase>(value),
    );
  }
}

String _$appDatabaseHash() => r'd45cc0b6c7795466b6a12d864805fefa097f39cd';

@ProviderFor(todoRepository)
const todoRepositoryProvider = TodoRepositoryProvider._();

final class TodoRepositoryProvider
    extends
        $FunctionalProvider<
          DriftTodoRepository,
          DriftTodoRepository,
          DriftTodoRepository
        >
    with $Provider<DriftTodoRepository> {
  const TodoRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoRepositoryHash();

  @$internal
  @override
  $ProviderElement<DriftTodoRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DriftTodoRepository create(Ref ref) {
    return todoRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DriftTodoRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DriftTodoRepository>(value),
    );
  }
}

String _$todoRepositoryHash() => r'2d2ae76221271192fa7db01f086a6a807665360d';

@ProviderFor(Todos)
const todosProvider = TodosProvider._();

final class TodosProvider extends $AsyncNotifierProvider<Todos, List<Todo>> {
  const TodosProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todosProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todosHash();

  @$internal
  @override
  Todos create() => Todos();
}

String _$todosHash() => r'f6b88a0ddb69fa182cef50ca6d6e786fd9b3bdd0';

abstract class _$Todos extends $AsyncNotifier<List<Todo>> {
  FutureOr<List<Todo>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<Todo>>, List<Todo>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<Todo>>, List<Todo>>,
              AsyncValue<List<Todo>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
