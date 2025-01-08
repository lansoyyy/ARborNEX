import 'package:flutter/material.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({super.key});

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  final List<Map<String, String>> newNotifications = [
    {
      'name': 'Harrison Grove',
      'message': 'I’m excited to apply my design skills as a garden designer.',
      'time': '',
      'image': 'assets/images/harg.png'
    },
    {
      'name': 'Jonathan Valdez',
      'message': 'I’d love to contribute my skills as a garden designer.',
      'time': '3 min ago',
      'image': 'assets/images/jot.png'
    },
  ];

  final List<Map<String, String>> yesterdayNotifications = [
    {
      'name': 'Jacy Julianne',
      'message':
          'Im excited to apply for the garden designer role, passionate about creating sustainable outdoor spaces.',
      'time': '02:10 pm',
      'image': 'assets/images/jacy.png'
    },
    {
      'name': 'Lana Hiery',
      'message':
          '"With attention to detail and love for nature, I’m excited to apply for the garden designer role."',
      'time': '11:40 am',
      'image': 'assets/images/lana.png'
    },
    {
      'name': 'Nikolai Smith',
      'message': 'Im eager to use my design skills to create stunning gardens',
      'time': '10:14 am',
      'image': 'assets/images/nik.png'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Handles the back button press
          },
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.cleaning_services, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const NoNotificationScreen()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            // New Section
            Text(
              'New',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            const SizedBox(height: 8),
            ...newNotifications
                .map((notification) => buildNotificationCard(notification)),
            const SizedBox(height: 16),

            // Yesterday Section
            Text(
              'Yesterday',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.teal[700],
              ),
            ),
            const SizedBox(height: 8),
            ...yesterdayNotifications
                .map((notification) => buildNotificationCard(notification)),
          ],
        ),
      ),
    );
  }

  Widget buildNotificationCard(Map<String, String> notification) {
    bool isFirstNotification = notification['name'] == 'Harrison Grove';

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.all(12),
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(notification['image']!),
        ),
        title: Text(
          notification['name']!,
          style: TextStyle(
            fontWeight:
                isFirstNotification ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text(
          notification['message']!,
          style: TextStyle(
            fontWeight:
                isFirstNotification ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.end, // Align to the bottom
          crossAxisAlignment: CrossAxisAlignment.end, // Align to the right side
          children: [
            const SizedBox(height: 10), // Add extra space above the time
            Text(
              notification['time']!,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey[800],
                fontWeight:
                    isFirstNotification ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// New Screen for "No Notification"
class NoNotificationScreen extends StatelessWidget {
  const NoNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_off,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No Notifications',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
