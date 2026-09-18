import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_provider/pages/users/user_detail_page.dart';
import 'package:riverpod_future_provider/pages/users/users_providers.dart';

class UserListPage extends ConsumerWidget {
  const UserListPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);

    print(userList);

    print(
      "isLoading: ${userList.isLoading}, isRefreshing: ${userList.isRefreshing}, isReloading: ${userList.isReloading}",
    );

    print("hasValue: ${userList.hasValue}, hasError: ${userList.hasError}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('User List'),
        actions: [
          IconButton(
            onPressed: () => ref.invalidate(userListProvider),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: 1 == 1
          ? userList.when(
              skipLoadingOnRefresh: false,
              data: (users) {
                return RefreshIndicator(
                  onRefresh: () async => ref.invalidate(userListProvider),
                  color: Colors.red,
                  child: ListView.separated(
                    physics: AlwaysScrollableScrollPhysics(),
                    itemCount: users.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider();
                    },
                    itemBuilder: (BuildContext context, int index) {
                      final user = users[index];

                      return ListTile(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => UserDetailPage(userId: user.id),
                            ),
                          );
                        },
                        leading: CircleAvatar(
                          backgroundColor: Colors.indigo,
                          child: Text(
                            user.id.toString(),
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                        title: Text(
                          user.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0,
                          ),
                        ),
                        subtitle: Text(
                          user.email,
                          style: const TextStyle(fontSize: 12.0),
                        ),
                      );
                    },
                  ),
                );
              },
              error: (err, stackTrace) {
                return Center(
                  child: Text(
                    stackTrace.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20.0, color: Colors.red),
                  ),
                );
              },
              loading: () => Center(child: CircularProgressIndicator()),
            )
          : switch (userList) {
              AsyncData(value: final users) => ListView.separated(
                itemCount: users.length,
                separatorBuilder: (BuildContext context, int index) {
                  return const Divider();
                },
                itemBuilder: (BuildContext context, int index) {
                  final user = users[index];

                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.indigo,
                      child: Text(
                        user.id.toString(),
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    title: Text(
                      user.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                      ),
                    ),
                    subtitle: Text(
                      user.email,
                      style: const TextStyle(fontSize: 12.0),
                    ),
                  );
                },
              ),
              AsyncError(error: final error) => Center(
                child: Text(
                  error.toString(),
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20.0, color: Colors.red),
                ),
              ),
              AsyncLoading() => Center(child: CircularProgressIndicator()),
            },
    );
  }
}
