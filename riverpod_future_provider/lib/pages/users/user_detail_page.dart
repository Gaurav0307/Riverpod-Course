import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_future_provider/pages/users/users_providers.dart';

class UserDetailPage extends ConsumerWidget {
  final int userId;
  const UserDetailPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(userDetailProvider(userId));

    print(user);

    print(
      "isLoading: ${user.isLoading}, isRefreshing: ${user.isRefreshing}, isReloading: ${user.isReloading}",
    );

    print("hasValue: ${user.hasValue}, hasError: ${user.hasError}");

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Detail'),
        actions: [
          IconButton(
            onPressed: () => ref.refresh(userDetailProvider(userId)),
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: user.when(
        skipLoadingOnRefresh: false,
        data: (user) {
          return RefreshIndicator(
            // onRefresh: () => ref.refresh(userDetailProvider(userId).future),
            onRefresh: () async => ref.refresh(userDetailProvider(userId)),
            color: Colors.red,
            child: ListView(
              physics: const AlwaysScrollableScrollPhysics(),
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 10.0,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue.shade50,
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.blue.shade400),
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 6.0,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.blue,
                              child: Text(
                                user.id.toString(),
                                style: const TextStyle(
                                  fontSize: 25.0,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            Text(
                              user.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(),
                      infoTile(
                        context: context,
                        icon: Icons.account_circle_rounded,
                        data: user.username,
                      ),
                      infoTile(
                        context: context,
                        icon: Icons.email,
                        data: user.email,
                      ),
                      infoTile(
                        context: context,
                        icon: Icons.phone,
                        data: user.phone,
                      ),
                      infoTile(
                        context: context,
                        icon: Icons.web_sharp,
                        data: user.website,
                      ),
                    ],
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.symmetric(
                //     horizontal: 20.0,
                //     vertical: 10.0,
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.orange.shade50,
                //     borderRadius: BorderRadius.circular(10.0),
                //     border: Border.all(color: Colors.orange.shade400),
                //   ),
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         "Address",
                //         style: TextStyle(
                //           fontSize: 20.0,
                //           fontWeight: FontWeight.w600,
                //           color: Colors.orange.shade400,
                //         ),
                //       ),
                //       const Divider(),
                //       dataTile(
                //         context: context,
                //         title: "Street",
                //         data: user.address.street,
                //       ),
                //       dataTile(
                //         context: context,
                //         title: "Suite",
                //         data: user.address.suite,
                //       ),
                //       dataTile(
                //         context: context,
                //         title: "City",
                //         data: user.address.city,
                //       ),
                //       dataTile(
                //         context: context,
                //         title: "Zipcode",
                //         data: user.address.zipcode,
                //       ),
                //       dataTile(
                //         context: context,
                //         title: "Geo Location (Lat)",
                //         data: user.address.geo.lat,
                //       ),
                //       dataTile(
                //         context: context,
                //         title: "Geo Location (Lng)",
                //         data: user.address.geo.lng,
                //       ),
                //     ],
                //   ),
                // ),
                // Container(
                //   margin: const EdgeInsets.symmetric(
                //     horizontal: 20.0,
                //     vertical: 10.0,
                //   ),
                //   decoration: BoxDecoration(
                //     color: Colors.green.shade50,
                //     borderRadius: BorderRadius.circular(10.0),
                //     border: Border.all(color: Colors.green.shade400),
                //   ),
                //   child: Column(
                //     mainAxisSize: MainAxisSize.min,
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: [
                //       Text(
                //         "Company",
                //         style: TextStyle(
                //           fontSize: 20.0,
                //           fontWeight: FontWeight.w600,
                //           color: Colors.green.shade400,
                //         ),
                //       ),
                //       const Divider(),
                //       dataTile(
                //         context: context,
                //         title: "Name",
                //         data: user.company.name,
                //       ),
                //       dataTile(
                //         context: context,
                //         title: "Catch Phrase",
                //         data: user.company.catchPhrase,
                //       ),
                //       dataTile(context: context, title: "BS", data: user.company.bs),
                //     ],
                //   ),
                // ),
              ],
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
      ),
    );
  }

  Widget infoTile({
    required BuildContext context,
    required IconData icon,
    required String data,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: (15.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: Colors.black54),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.6,
            child: Text(
              data,
              textAlign: TextAlign.end,
              maxLines: 2,
              style: const TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
