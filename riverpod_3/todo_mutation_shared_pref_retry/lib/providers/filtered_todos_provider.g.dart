// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_todos_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(filteredTodos)
final filteredTodosProvider = FilteredTodosFamily._();

final class FilteredTodosProvider
    extends $FunctionalProvider<List<Todo>, List<Todo>, List<Todo>>
    with $Provider<List<Todo>> {
  FilteredTodosProvider._({
    required FilteredTodosFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'filteredTodosProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$filteredTodosHash();

  @override
  String toString() {
    return r'filteredTodosProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<List<Todo>> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  List<Todo> create(Ref ref) {
    final argument = this.argument as String;
    return filteredTodos(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<Todo> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<Todo>>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is FilteredTodosProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$filteredTodosHash() => r'4904b8073816fd3db742c6aa07e3a47582ef348f';

final class FilteredTodosFamily extends $Family
    with $FunctionalFamilyOverride<List<Todo>, String> {
  FilteredTodosFamily._()
    : super(
        retry: null,
        name: r'filteredTodosProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FilteredTodosProvider call(String filter) =>
      FilteredTodosProvider._(argument: filter, from: this);

  @override
  String toString() => r'filteredTodosProvider';
}
