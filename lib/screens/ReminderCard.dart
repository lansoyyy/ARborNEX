import 'package:flutter/material.dart';

class ReminderCard extends StatelessWidget {
  final String plantName;
  final String status;
  final String purchaseDate;
  final String image;

  ReminderCard({
    required this.plantName,
    required this.status,
    required this.purchaseDate,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    // Define the color based on the status
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
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12), // Rounded corners
      ),
      elevation: 4,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8), // Rounded image
          child: Image.network(
            image,
            width: 50,
            height: 50,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.image, color: Colors.grey); // Placeholder if image fails
            },
          ),
        ),
        title: Text(
          plantName,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 4),
            Text(
              'Purchased on: $purchaseDate',
              style: TextStyle(color: Colors.grey, fontSize: 14),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.wb_sunny, color: Colors.orange, size: 18),
                SizedBox(width: 8),
                Icon(Icons.water_drop, color: Colors.blue, size: 18),
              ],
            ),
          ],
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          size: 16,
          color: Colors.grey,
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        tileColor: statusColor.withOpacity(0.1), // Add a light background based on the status
      ),
    );
  }
}
