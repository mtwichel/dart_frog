import 'dart:async';

import 'package:dart_frog/dart_frog.dart';

/// Provide a value to the current handler by calling [create] lazily.
Middleware provider<T extends Object>(
  FutureOr<T> Function(RequestContext context) create,
) {
  return (handler) {
    return (context) =>
        handler(context.provide(() async => await create(context)));
  };
}
