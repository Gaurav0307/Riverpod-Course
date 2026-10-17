// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'storage_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(storage)
final storageProvider = StorageProvider._();

final class StorageProvider
    extends
        $FunctionalProvider<
          AsyncValue<SharedPreferenceStorage>,
          SharedPreferenceStorage,
          FutureOr<SharedPreferenceStorage>
        >
    with
        $FutureModifier<SharedPreferenceStorage>,
        $FutureProvider<SharedPreferenceStorage> {
  StorageProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'storageProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$storageHash();

  @$internal
  @override
  $FutureProviderElement<SharedPreferenceStorage> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<SharedPreferenceStorage> create(Ref ref) {
    return storage(ref);
  }
}

String _$storageHash() => r'da9ec9f99b84a6cbc351f481417f01fb43b5a788';
