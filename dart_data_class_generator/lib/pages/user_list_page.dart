import 'package:dart_data_class_generator/models/user.dart';
import 'package:dart_data_class_generator/pages/user_details.dart';
import 'package:dart_data_class_generator/repositories/user_repository.dart';
import 'package:flutter/material.dart';

class UserListPage extends StatefulWidget {
  const new({super.key});

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  List<User> users = [];
  String error = '';
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    fetchUsers();
  }

  void fetchUsers() async {
    try {
      setState(() {
        isLoading = true;
      });

      users = await UserRepository().getUser();

      error = '';
    } catch (e) {
      error = e.toString();
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : error.isNotEmpty
            ? buildError(error)
            : ListUsers(users: users),
      ),
    );
  }

  Widget buildError(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              error,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.red),
            ),
            const SizedBox(height: 20.0),
            OutlinedButton(onPressed: fetchUsers, child: const Text('Retry')),
          ],
        ),
      ),
    );
  }
}

class ListUsers extends StatelessWidget {
  const ListUsers({super.key, required this.users});

  final List<User> users;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => ListTile(
        onTap: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => UserDetails(user: users[index])),
        ),
        leading: CircleAvatar(
          backgroundColor: Colors.indigo,
          child: Text(
            users[index].id.toString(),
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          users[index].name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
        ),
        subtitle: Text(
          users[index].email,
          style: const TextStyle(fontSize: 12.0),
        ),
      ),
      separatorBuilder: (context, index) => const Divider(),
      itemCount: users.length,
    );
  }
}
