import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:riverpod_notifier_provider/models/activity.dart';
import 'package:riverpod_notifier_provider/pages/sealed_activity/sealed_activity_provider.dart';
import 'package:riverpod_notifier_provider/pages/sealed_activity/sealed_activity_state.dart';

class SealedActivityPage extends ConsumerStatefulWidget {
  const SealedActivityPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SealedActivityPageState();
}

class _SealedActivityPageState extends ConsumerState<SealedActivityPage> {
  Widget? activityWidget;

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      fetchActivity();
    });
  }

  void fetchActivity() {
    final index = Random().nextInt(activityTypes.length);

    ref
        .read(sealedActivityProvider.notifier)
        .getActivities(activityTypes[index]);
  }

  @override
  Widget build(BuildContext context) {
    final sealedActivityState = ref.watch(sealedActivityProvider);

    ref.listen<SealedActivityState>(sealedActivityProvider, (previous, next) {
      switch (next) {
        case SealedActivityFailure(error: final error):
          showDialog<void>(
            context: context,
            builder: (context) =>
                AlertDialog(title: const Text('Error'), content: Text(error)),
          );

        // case SealedActivitySuccess(activity: final activity):
        //   activityWidget = ActivityCard(activity: activity);

        case _:
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sealed Activity'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.invalidate(sealedActivityProvider),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      body: switch (sealedActivityState) {
        SealedActivityInitial() => Center(
          child: const Text(
            "Get some activity",
            style: TextStyle(fontSize: 24.0),
          ),
        ),
        SealedActivityLoading() => Center(
          child: const CircularProgressIndicator(),
        ),
        SealedActivitySuccess(activity: final activity) =>
          activityWidget = ActivityCard(activity: activity),
        SealedActivityFailure() =>
          activityWidget ??
              Center(
                child: const Text(
                  "Get some activity",
                  style: TextStyle(fontSize: 24.0),
                ),
              ),
      },
      floatingActionButton: FloatingActionButton.extended(
        onPressed: fetchActivity,
        label: Text("New Activity"),
      ),
    );
  }
}

class ActivityCard extends StatelessWidget {
  final Activity activity;
  final VoidCallback? onRefresh;

  const ActivityCard({super.key, required this.activity, this.onRefresh});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.blue.withValues(alpha: 0.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  CircleAvatar(
                    radius: 20.0,
                    backgroundColor: Colors.white24,
                    child: Text(
                      activity.availability.toString(),
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontSize: 18.0,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  const Spacer(),
                  if (onRefresh != null)
                    IconButton(
                      onPressed: onRefresh,
                      icon: const Icon(
                        Icons.refresh_rounded,
                        color: Colors.white,
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 20),

              Text(
                activity.activity,
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: Colors.white24,
                  borderRadius: BorderRadius.circular(100),
                ),
                child: Text(
                  activity.type.toUpperCase(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    letterSpacing: 1,
                  ),
                ),
              ),

              const SizedBox(height: 24.0),

              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: _InfoTile(
                      icon: Icons.group_rounded,
                      title: "Participants",
                      value: activity.participants.toString(),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _InfoTile(
                      icon: Icons.accessibility_new_rounded,
                      title: "Accessibility",
                      value: activity.accessibility,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 12),

              Row(
                children: [
                  Expanded(
                    child: _InfoTile(
                      icon: Icons.payments_outlined,
                      title: "Price",
                      value: activity.price == 0
                          ? "Free"
                          : "\$${activity.price.toStringAsFixed(2)}",
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: _InfoTile(
                      icon: Icons.key_rounded,
                      title: "Key",
                      value: activity.key,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _InfoTile extends StatelessWidget {
  final IconData icon;
  final String title;
  final String value;

  const _InfoTile({
    required this.icon,
    required this.title,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.white, size: 24),
          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(color: Colors.white70, fontSize: 12),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
