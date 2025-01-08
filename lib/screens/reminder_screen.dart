import 'package:flutter/material.dart';
import 'package:landscape/screens/category_screen.dart';
import 'package:landscape/screens/setting_screen.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: ReminderScreen(),
//     );
//   }
// }

class ReminderScreen extends StatefulWidget {
  const ReminderScreen({super.key});

  @override
  _ReminderScreenState createState() => _ReminderScreenState();
}

class _ReminderScreenState extends State<ReminderScreen>
    with SingleTickerProviderStateMixin {
  // Tab controller
  late TabController _tabController;

  // List of plants with their statuses
  final List<Map<String, String>> plants = [
    {
      'name': 'Calla Lily',
      'status': 'completed',
      'purchaseDate': '14 days ago',
      'image': 'assets/images/plant3.png',
    },
    {
      'name': 'Terrarium',
      'status': 'in progress',
      'purchaseDate': '14 days ago',
      'image': 'assets/images/plant4.png',
    },
    {
      'name': 'Grey Star Calathea',
      'status': 'pending',
      'purchaseDate': '14 days ago',
      'image': 'assets/images/plant5.png',
    },
    {
      'name': 'Dracaena Trifasciata',
      'status': 'pending',
      'purchaseDate': '14 days ago',
      'image': 'assets/images/plant6.png',
    },
  ];

  // Selected filter
  String selectedFilter = 'all';

  // Selected day
  int selectedDay = 4; // Default selected day (e.g., Thursday)

  // Filter plants based on selected filter
  List<Map<String, String>> get filteredPlants {
    if (selectedFilter == 'all') return plants;
    return plants.where((plant) => plant['status'] == selectedFilter).toList();
  }

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this); // 2 tabs
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Padding(
          padding: EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundImage: AssetImage('assets/images/profiles.png'),
          ),
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
              // Navigate to the SettingsScreen
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SettingsScreen()),
              );
            },
          ),
        ],
        bottom: TabBar(
          controller: _tabController,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.green,
          tabs: const [
            Tab(text: 'Reminders'),
            Tab(text: 'Cart'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          // Reminder Tab Content
          Column(
            children: [
              // Days of the week
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: List.generate(7, (index) {
                    final days = [
                      'Sun',
                      'Mon',
                      'Tue',
                      'Wed',
                      'Thu',
                      'Fri',
                      'Sat'
                    ];
                    return GestureDetector(
                      onTap: () => setState(() => selectedDay = index),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 12),
                        decoration: BoxDecoration(
                          color: selectedDay == index
                              ? Colors.green
                              : Colors.transparent,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Column(
                          children: [
                            Text(
                              days[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: selectedDay == index
                                    ? Colors.white
                                    : Colors.black,
                              ),
                            ),
                            if (selectedDay == index) const SizedBox(height: 4),
                            if (selectedDay == index)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: const BoxDecoration(
                                  color: Colors.green,
                                  shape: BoxShape.circle,
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
              ),
              // Title and Calendar Icon
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Today Reminders',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Icon(Icons.calendar_today, color: Colors.grey),
                  ],
                ),
              ),
              // Filter Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FilterButton(
                      label: 'All',
                      isSelected: selectedFilter == 'all',
                      onTap: () => setState(() => selectedFilter = 'all'),
                    ),
                    FilterButton(
                      label: 'Completed',
                      isSelected: selectedFilter == 'completed',
                      onTap: () => setState(() => selectedFilter = 'completed'),
                    ),
                    FilterButton(
                      label: 'In Progress',
                      isSelected: selectedFilter == 'in progress',
                      onTap: () =>
                          setState(() => selectedFilter = 'in progress'),
                    ),
                    FilterButton(
                      label: 'Pending',
                      isSelected: selectedFilter == 'pending',
                      onTap: () => setState(() => selectedFilter = 'pending'),
                    ),
                  ],
                ),
              ),
              // List of Reminders
              Expanded(
                child: ListView(
                  children: filteredPlants.map((plant) {
                    return ReminderCard(
                      plantName: plant['name']!,
                      status: plant['status']!,
                      purchaseDate: plant['purchaseDate']!,
                    );
                  }).toList(),
                ),
              ),
            ],
          ),
          // Cart Tab Content
          // Cart Tab Content
          Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40), // Space from top
                const Center(
                  child: Column(
                    children: [
                      Text(
                        'Your cart is empty',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Add plants while you shop, so\n they'll be ready for checkout later.",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 40), // Space before categories
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0),
                  child: Text(
                    'Dive into a category',
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    children: const [
                      CategoryCard(
                          label: 'Indoor Garden',
                          imagePath: 'assets/images/IG.png'),
                      CategoryCard(
                          label: 'Outdoor Garden',
                          imagePath: 'assets/images/OG.png'),
                      CategoryCard(
                          label: 'Cottage Garden',
                          imagePath: 'assets/images/CG.png'),
                      CategoryCard(
                          label: 'Greenhouse Garden',
                          imagePath: 'assets/images/GG.png'),
                      CategoryCard(
                          label: 'Rock Garden',
                          imagePath: 'assets/images/RG.png'),
                      CategoryCard(
                          label: 'Traditional Garden',
                          imagePath: 'assets/images/TG.png'),
                    ],
                  ),
                ),
              ],
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

  const ReminderCard({
    super.key,
    required this.plantName,
    required this.status,
    required this.purchaseDate,
  });

  @override
  Widget build(BuildContext context) {
    Color statusColor;
    switch (status) {
      case 'completed':
        statusColor = Colors.green;
        break;
      case 'in progress':
        statusColor = Colors.orange;
        break;
      case 'pending':
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        leading: Icon(Icons.local_florist, color: statusColor, size: 40),
        title: Text(plantName,
            style: const TextStyle(fontWeight: FontWeight.bold)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Purchased on: $purchaseDate'),
            const SizedBox(height: 4),
            const Row(
              children: [
                Icon(Icons.wb_sunny, color: Colors.orange, size: 16),
                SizedBox(width: 8),
                Icon(Icons.water_drop, color: Colors.blue, size: 16),
              ],
            ),
          ],
        ),
        trailing:
            const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
      ),
    );
  }
}
