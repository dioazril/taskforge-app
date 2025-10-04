import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:logger/logger.dart';

final class Observer extends ProviderObserver {
  final logger = Logger();

  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    logger.i(
      'Provider: ${context.provider.name ?? context.provider.runtimeType}, '
      'New Value: $newValue, '
      'Previous Value: $previousValue',
    );
  }

  @override
  void didDisposeProvider(ProviderObserverContext context) {
    logger.w(
      'Provider disposed: ${context.provider.name ?? context.provider.runtimeType}',
    );
  }

  @override
  void didAddProvider(ProviderObserverContext context, Object? value) {
    logger.i(
      'Provider added: ${context.provider.name ?? context.provider.runtimeType}, '
      'Initial Value: $value',
    );
  }

  @override
  void providerDidFail(
    ProviderObserverContext context,
    Object error,
    StackTrace stackTrace,
  ) {
    logger.e(
      'Provider failed: ${context.provider.name ?? context.provider.runtimeType}, '
      'Error: $error, '
      'StackTrace: $stackTrace',
    );
  }
}
