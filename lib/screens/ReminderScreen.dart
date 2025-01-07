import 'package:flutter/material.dart';
import 'package:landscape/screens/main_screen.dart';
import 'package:landscape/screens/setting_screen.dart';

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen> {
  String selectedFilter = 'All'; // Default filter

  // List of reminders
  final List<Map<String, String>> reminders = [
    {
      'plantName': 'Calla Lily',
      'status': 'completed',
      'purchaseDate': '14 days ago'
    },
    {
      'plantName': 'Terrarium',
      'status': 'in progress',
      'purchaseDate': '14 days ago'
    },
    {
      'plantName': 'Grey Star Calathea',
      'status': 'pending',
      'purchaseDate': '14 days ago'
    },
    {
      'plantName': 'Dracaena Trifasciata',
      'status': 'pending',
      'purchaseDate': '14 days ago'
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filtered list based on the selected filter
    List<Map<String, String>> filteredReminders = selectedFilter == 'All'
        ? reminders
        : reminders
            .where((reminder) =>
                reminder['status'] == selectedFilter.toLowerCase())
            .toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (context) =>
                      const MainScreen()), // Replace MainScreen() with your actual main screen widget.
            );
          },
        ),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Joel Manalo',
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              '0393*******',
              style: TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Today Reminders',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.calendar_today, color: Colors.grey),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FilterButton(
                  label: 'All',
                  isSelected: selectedFilter == 'All',
                  onTap: () => setState(() => selectedFilter = 'All'),
                ),
                FilterButton(
                  label: 'Completed',
                  isSelected: selectedFilter == 'Completed',
                  onTap: () => setState(() => selectedFilter = 'Completed'),
                ),
                FilterButton(
                  label: 'In Progress',
                  isSelected: selectedFilter == 'In Progress',
                  onTap: () => setState(() => selectedFilter = 'In Progress'),
                ),
                FilterButton(
                  label: 'Pending',
                  isSelected: selectedFilter == 'Pending',
                  onTap: () => setState(() => selectedFilter = 'Pending'),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: filteredReminders.map((reminder) {
                return ReminderCard(
                  plantName: reminder['plantName']!,
                  status: reminder['status']!,
                  purchaseDate: reminder['purchaseDate']!,
                  image:
                      'https://via.placeholder.com/150', // Use a placeholder or image URL
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton(
      {super.key,
      required this.label,
      required this.isSelected,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey[200],
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class ReminderCard extends StatelessWidget {
  final String plantName;
  final String status;
  final String purchaseDate;
  final String image;

  const ReminderCard({
    super.key,
    required this.plantName,
    required this.status,
    required this.purchaseDate,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8.0),
      child: ListTile(
        leading: Image.network(image),
        title: Text(plantName),
        subtitle: Text('$status • $purchaseDate'),
      ),
    );
  }
}
