import 'package:flutter/material.dart';
import 'package:riverpod_freezed/models/hotel.dart';
import 'package:riverpod_freezed/repository/hotel_repository.dart';

class HotelListPage extends StatefulWidget {
  const new({super.key});

  @override
  State<HotelListPage> createState() => _HotelListPageState();
}

class _HotelListPageState extends State<HotelListPage> {
  List<Hotel> hotels = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchHotels();
  }

  Future<void> fetchHotels() async {
    hotels = await HotelRepository().fetchHotels();

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hotel List')),
      body: isLoading
          ? const Center(child: CircularProgressIndicator())
          : ListView.separated(
              itemCount: hotels.length,
              itemBuilder: (context, index) {
                final hotel = hotels[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 8.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        hotel.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text('Classification: ${hotel.classification}'),
                      Text('City: ${hotel.city}'),
                      Text('Parking Lot Capacity: ${hotel.parkingLotCapacity}'),
                      hotel.reviews.isEmpty
                          ? const Text('No Reviews')
                          : ListView.separated(
                              primary: false, // To remove scroll. Use only when the list is a child of a scroll widget
                              shrinkWrap: true, // Take up minimum space or as much as children need
                              itemBuilder: (context, index) => ListTile(
                                leading: CircleAvatar(
                                  child: Text('${hotel.reviews[index].score}'),
                                ),
                                title: Text(
                                  hotel.reviews[index].review ?? 'No Review',
                                ),
                              ),
                              separatorBuilder: (context, index) =>
                                  const Divider(),
                              itemCount: hotel.reviews.length,
                            ),
                    ],
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(),
            ),
    );
  }
}
