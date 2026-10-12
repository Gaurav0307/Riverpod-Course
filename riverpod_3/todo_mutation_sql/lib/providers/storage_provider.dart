import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod_sqflite/riverpod_sqflite.dart';
import 'package:sqflite/sqflite.dart';

part 'storage_provider.g.dart';

@riverpod
FutureOr<JsonSqFliteStorage> storage(Ref ref) async {
  final dbPath = join(await getDatabasesPath(), 'todos.db');
  return JsonSqFliteStorage.open(dbPath);
}
