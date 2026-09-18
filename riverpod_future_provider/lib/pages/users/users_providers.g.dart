// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'users_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userList)
final userListProvider = UserListProvider._();

final class UserListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<User>>,
          List<User>,
          FutureOr<List<User>>
        >
    with $FutureModifier<List<User>>, $FutureProvider<List<User>> {
  UserListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userListHash();

  @$internal
  @override
  $FutureProviderElement<List<User>> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<List<User>> create(Ref ref) {
    return userList(ref);
  }
}

String _$userListHash() => r'9c41ef9e2c1443d6e04bcd668a11568a366f1b45';

@ProviderFor(userDetail)
final userDetailProvider = UserDetailFamily._();

final class UserDetailProvider
    extends $FunctionalProvider<AsyncValue<User>, User, FutureOr<User>>
    with $FutureModifier<User>, $FutureProvider<User> {
  UserDetailProvider._({
    required UserDetailFamily super.from,
    required int super.argument,
  }) : super(
         retry: null,
         name: r'userDetailProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userDetailHash();

  @override
  String toString() {
    return r'userDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<User> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<User> create(Ref ref) {
    final argument = this.argument as int;
    return userDetail(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserDetailProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userDetailHash() => r'bbad72b44e8732c79a699374d09c08978090a18c';

final class UserDetailFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<User>, int> {
  UserDetailFamily._()
    : super(
        retry: null,
        name: r'userDetailProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserDetailProvider call(int id) =>
      UserDetailProvider._(argument: id, from: this);

  @override
  String toString() => r'userDetailProvider';
}
