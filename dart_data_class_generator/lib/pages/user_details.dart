import 'package:dart_data_class_generator/models/user.dart';
import 'package:flutter/material.dart';

class UserDetails extends StatelessWidget {
  final User user;
  const UserDetails({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.white,
            child: Text(
              user.id.toString(),
              style: const TextStyle(color: Colors.indigo),
            ),
          ),
          title: Text(
            user.name,
            style: const TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: ListView(
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
                Text(
                  "Basic Info",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.blue.shade400,
                  ),
                ),
                const Divider(),
                dataTile(
                  context: context,
                  title: "Username",
                  data: user.username,
                ),
                dataTile(context: context, title: "Email", data: user.email),
                dataTile(context: context, title: "Phone", data: user.phone),
                dataTile(
                  context: context,
                  title: "Website",
                  data: user.website,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              color: Colors.orange.shade50,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.orange.shade400),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Address",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.orange.shade400,
                  ),
                ),
                const Divider(),
                dataTile(
                  context: context,
                  title: "Street",
                  data: user.address.street,
                ),
                dataTile(
                  context: context,
                  title: "Suite",
                  data: user.address.suite,
                ),
                dataTile(
                  context: context,
                  title: "City",
                  data: user.address.city,
                ),
                dataTile(
                  context: context,
                  title: "Zipcode",
                  data: user.address.zipcode,
                ),
                dataTile(
                  context: context,
                  title: "Geo Location (Lat)",
                  data: user.address.geo.lat,
                ),
                dataTile(
                  context: context,
                  title: "Geo Location (Lng)",
                  data: user.address.geo.lng,
                ),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            decoration: BoxDecoration(
              color: Colors.green.shade50,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(color: Colors.green.shade400),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Company",
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.green.shade400,
                  ),
                ),
                const Divider(),
                dataTile(
                  context: context,
                  title: "Name",
                  data: user.company.name,
                ),
                dataTile(
                  context: context,
                  title: "Catch Phrase",
                  data: user.company.catchPhrase,
                ),
                dataTile(context: context, title: "BS", data: user.company.bs),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget dataTile({
    required BuildContext context,
    required String title,
    required String data,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: (15.0)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title:',
            style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w600),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.4,
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
