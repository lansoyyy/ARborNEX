import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  final String imagePath;
  final String title;
  final String number;
  final String email;
  final String projectDescription;
  final String additionalInfo;
  final String likes;

  DetailsScreen({
    required this.imagePath,
    required this.title,
    required this.number,
    required this.email,
    required this.projectDescription,
    required this.additionalInfo,
    required this.likes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          // Header Section
          Container(
            decoration: BoxDecoration(
              color: Color(0xFF004422),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(24),
                bottomRight: Radius.circular(24),
              ),
            ),
            padding: EdgeInsets.symmetric(vertical: 40, horizontal: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                // Back Button
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),

                // Profile Image
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  backgroundImage:
                      AssetImage(imagePath), // Using the passed imagePath here
                ),
                SizedBox(height: 16),
                // Title and Subtitle
                Text(
                  "Hi, I'm $title",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 4),
                Text(
                  "Landscape Architect",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                SizedBox(height: 16),

                // Contact Information
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "$number",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.email, color: Colors.white),
                    SizedBox(width: 8),
                    Text(
                      "$email",
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Description Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // "Why Hire Me?" Section
                    Text(
                      "Why Hire Me?",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004422),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      projectDescription,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                    ),
                    SizedBox(height: 16),

                    // Additional Information Section
                    Text(
                      "Project Gallery",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF004422),
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      additionalInfo,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
