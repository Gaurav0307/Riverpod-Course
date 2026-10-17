import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'counter_provider.g.dart';

@riverpod
class Counter extends _$Counter {
  @override
  int build() {
    return 0;
  }

  Future<void> incrementWithDelay() async {
    print("---> Started Task (currently mounted : ${ref.mounted}) >>>");

    await Future.delayed(const Duration(seconds: 2));

    print("---> 2 seconds later (currently mounted : ${ref.mounted}) >>>");

    if (!ref.mounted) {
      print(
        "Provider has already been disposed. State update will be skipped.",
      );
      return;
    }

    state++;

    print("State update complete: $state");
  }
}
