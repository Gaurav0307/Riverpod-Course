import 'package:flutter/material.dart';
import 'package:riverpod_stream_provider/pages/timer/action_buttons.dart';
import 'package:riverpod_stream_provider/pages/timer/timer_value.dart';

class TimerPage extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Timer')),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [TimerValue(), SizedBox(height: 20), ActionButtons()],
        ),
      ),
    );
  }
}
