import 'package:riverpod_annotation/experimental/persist.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'storage_provider.g.dart';

final class SharedPreferenceStorage extends Storage<String, String> {
  new(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  FutureOr<PersistedData<String>?> read(String key) {
    final value = sharedPreferences.getString(key);

    return value == null ? null : PersistedData(value);
  }

  @override
  FutureOr<void> write(String key, String value, StorageOptions options) async {
    await sharedPreferences.setString(key, value);
  }

  @override
  FutureOr<void> delete(String key) async {
    await sharedPreferences.remove(key);
  }

  @override
  void deleteOutOfDate() {}
}

@riverpod
FutureOr<SharedPreferenceStorage> storage(Ref ref) async {
  final sharedPreferences = await SharedPreferences.getInstance();

  return SharedPreferenceStorage(sharedPreferences);
}
